﻿; ===============================================================================================================================
; CRC32 Implementation in AutoHotkey
; ===============================================================================================================================

CRC32(str)
{
    static table := []
    loop 256 {
        crc := A_Index - 1
        loop 8
            crc := (crc & 1) ? (crc >> 1) ^ 0xEDB88320 : (crc >> 1)
        table[A_Index - 1] := crc
    }
    crc := ~0
    loop, parse, str
        crc := table[(crc & 0xFF) ^ Asc(A_LoopField)] ^ (crc >> 8)
    return Format("{:#x}", ~crc)
}

; ===============================================================================================================================

MsgBox % CRC32("The quick brown fox jumps over the lazy dog")    ; -> 0x414fa339



; ===============================================================================================================================
; CRC32 via DllCall (WinAPI)
; ===============================================================================================================================

CRC32(str, enc = "UTF-8")
{
    l := (enc = "CP1200" || enc = "UTF-16") ? 2 : 1, s := (StrPut(str, enc) - 1) * l
    VarSetCapacity(b, s, 0) && StrPut(str, &b, floor(s / l), enc)
    CRC32 := DllCall("ntdll.dll\RtlComputeCrc32", "UInt", 0, "Ptr", &b, "UInt", s)
    return Format("{:#x}", CRC32)
}

; ===============================================================================================================================

MsgBox % CRC32("The quick brown fox jumps over the lazy dog")    ; -> 0x414fa339



; ===============================================================================================================================
; CRC32 Files via DllCall (WinAPI)
; ===============================================================================================================================

CRC32_File(filename)
{
    if !(f := FileOpen(filename, "r", "UTF-8"))
        throw Exception("Failed to open file: " filename, -1)
    f.Seek(0)
    while (dataread := f.RawRead(data, 262144))
        crc := DllCall("ntdll.dll\RtlComputeCrc32", "uint", crc, "ptr", &data, "uint", dataread, "uint")
    f.Close()
    return Format("{:#x}", crc)
}

; ===============================================================================================================================

MsgBox % CRC32_File("C:\Windows\notepad.exe")    ; -> 0x30c6fae2