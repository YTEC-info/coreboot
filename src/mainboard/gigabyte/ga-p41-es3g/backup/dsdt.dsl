/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200925 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of dsdt.dat, Sat Aug 26 13:26:07 2023
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x00003AA5 (15013)
 *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
 *     Checksum         0xC1
 *     OEM ID           "GBT   "
 *     OEM Table ID     "GBTUACPI"
 *     OEM Revision     0x00001000 (4096)
 *     Compiler ID      "MSFT"
 *     Compiler Version 0x0100000C (16777228)
 */
DefinitionBlock ("", "DSDT", 1, "GBT   ", "GBTUACPI", 0x00001000)
{
    Scope (\_PR)
    {
        Processor (\_PR.CPU0, 0x00, 0x00000410, 0x06) {}
        Processor (\_PR.CPU1, 0x01, 0x00000410, 0x06) {}
        Processor (\_PR.CPU2, 0x02, 0x00000410, 0x06) {}
        Processor (\_PR.CPU3, 0x03, 0x00000410, 0x06) {}
    }

    Name (\_S0, Package (0x04)  // _S0_: S0 System State
    {
        0x00, 
        0x00, 
        0x00, 
        0x00
    })
    Name (\SS1, Package (0x04)
    {
        0x01, 
        0x00, 
        0x00, 
        0x00
    })
    Name (\_S3, Package (0x04)  // _S3_: S3 System State
    {
        0x05, 
        0x00, 
        0x00, 
        0x00
    })
    Name (\_S4, Package (0x04)  // _S4_: S4 System State
    {
        0x06, 
        0x00, 
        0x00, 
        0x00
    })
    Name (\_S5, Package (0x04)  // _S5_: S5 System State
    {
        0x07, 
        0x00, 
        0x00, 
        0x00
    })
    Name (FLAG, 0x00)
    Name (STAT, 0x00)
    OperationRegion (SMOD, SystemMemory, 0x000FF840, 0x01)
    Field (SMOD, ByteAcc, NoLock, Preserve)
    {
            ,   7, 
        SUSF,   1
    }

    OperationRegion (LBOC, SystemMemory, 0x000FF820, 0x02)
    Field (LBOC, ByteAcc, NoLock, Preserve)
    {
        UBMC,   1, 
        Offset (0x02)
    }

    OperationRegion (\DEBG, SystemIO, 0x80, 0x01)
    Field (\DEBG, ByteAcc, NoLock, Preserve)
    {
        DBG1,   8
    }

    OperationRegion (RCRB, SystemMemory, 0xFED1C000, 0x4000)
    Field (RCRB, DWordAcc, Lock, Preserve)
    {
        Offset (0x3404), 
            ,   7, 
        HPTF,   1
    }

    OperationRegion (ELKM, SystemMemory, 0x000FFFEA, 0x01)
    Field (ELKM, ByteAcc, NoLock, Preserve)
    {
            ,   1, 
            ,   1, 
        ELSO,   1, 
            ,   1, 
            ,   1, 
            ,   1, 
            ,   1
    }

    OperationRegion (EXTM, SystemMemory, 0x000FF830, 0x10)
    Field (EXTM, WordAcc, NoLock, Preserve)
    {
        ROM1,   16, 
        RMS1,   16, 
        ROM2,   16, 
        RMS2,   16, 
        ROM3,   16, 
        RMS3,   16, 
        AMEM,   32
    }

    OperationRegion (\SMIC, SystemIO, 0xB2, 0x01)
    Field (\SMIC, ByteAcc, NoLock, Preserve)
    {
        SCP,    8
    }

    OperationRegion (\GP2C, SystemIO, 0x042C, 0x02)
    Field (\GP2C, ByteAcc, NoLock, Preserve)
    {
        G2C1,   8, 
        G2C2,   8
    }

    OperationRegion (APMP, SystemIO, 0xB2, 0x02)
    Field (APMP, ByteAcc, NoLock, Preserve)
    {
        APMC,   8, 
        APMD,   8
    }

    OperationRegion (\AGPS, SystemIO, 0x0438, 0x04)
    Field (\AGPS, ByteAcc, NoLock, Preserve)
    {
        GPSE,   16, 
        GPSS,   16
    }

    OperationRegion (\GPCN, SystemIO, 0x0442, 0x01)
    Field (\GPCN, ByteAcc, NoLock, Preserve)
    {
            ,   1, 
        SWGC,   1, 
        Offset (0x01)
    }

    Name (OSFX, 0x01)
    Name (LINX, 0x00)
    Name (AMAC, 0x00)
    Name (OSFL, 0x01)
    Method (STRC, 2, NotSerialized)
    {
        If ((SizeOf (Arg0) != SizeOf (Arg1)))
        {
            Return (0x00)
        }

        Local0 = (SizeOf (Arg0) + 0x01)
        Name (BUF0, Buffer (Local0) {})
        Name (BUF1, Buffer (Local0) {})
        BUF0 = Arg0
        BUF1 = Arg1
        While (Local0)
        {
            Local0--
            If ((DerefOf (BUF0 [Local0]) != DerefOf (BUF1 [Local0]
                )))
            {
                Return (Zero)
            }
        }

        Return (One)
    }

    OperationRegion (INFO, SystemMemory, 0x000FF840, 0x01)
    Field (INFO, ByteAcc, NoLock, Preserve)
    {
        KBDI,   1, 
        RTCW,   1, 
        PS2F,   1, 
        IRFL,   2, 
        DISE,   1, 
        SSHU,   1
    }

    Scope (\)
    {
        Name (PICF, 0x00)
        Method (_PIC, 1, NotSerialized)  // _PIC: Interrupt Model
        {
            PICF = Arg0
        }
    }

    Method (\_PTS, 1, NotSerialized)  // _PTS: Prepare To Sleep
    {
        Local0 = (Arg0 | 0xF0)
        DBG1 = Local0
        OSTP ()
        If ((Arg0 == 0x01)) {}
        If ((Arg0 == 0x03)) {}
        If ((Arg0 == 0x05))
        {
            SMIP = 0x99
        }

        If ((Arg0 == 0x04))
        {
            If (!PICF)
            {
                Sleep (0x64)
            }
        }
    }

    Method (\_WAK, 1, NotSerialized)  // _WAK: Wake
    {
        DBG1 = 0xFF
        If ((Arg0 == 0x03))
        {
            SCP = 0x8F
        }

        If ((Arg0 == 0x04))
        {
            If ((OSFL == 0x01))
            {
                SMIP = 0x56
            }

            If ((OSFL == 0x02))
            {
                SMIP = 0x57
            }

            If ((OSFL == 0x00))
            {
                Local0 = 0x58
                If ((OSFX == 0x03))
                {
                    Local0 = 0x59
                }

                SMIP = Local0
            }
        }

        If ((Arg0 == 0x01)) {}
        If (OSFL)
        {
            Notify (\_SB.PWRB, 0x02) // Device Wake
        }
        ElseIf ((RTCW == 0x00))
        {
            Notify (\_SB.PWRB, 0x02) // Device Wake
        }

        Notify (\_SB.PCI0.USB0, 0x00) // Bus Check
        Notify (\_SB.PCI0.USB1, 0x00) // Bus Check
        Notify (\_SB.PCI0.USB2, 0x00) // Bus Check
        Notify (\_SB.PCI0.USB3, 0x00) // Bus Check
    }

    Scope (\_SI)
    {
        Method (_MSG, 1, NotSerialized)  // _MSG: Message
        {
            Local0 = Local0
        }

        Method (_SST, 1, NotSerialized)  // _SST: System Status
        {
            Local0 = Local0
        }
    }

    Scope (\_GPE)
    {
        Method (_L08, 0, NotSerialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
        {
            Notify (\_SB.PCI0.PX40.UAR1, 0x02) // Device Wake
        }

        Method (_L03, 0, NotSerialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
        {
            Notify (\_SB.PCI0.USB0, 0x02) // Device Wake
            Notify (\_SB.PWRB, 0x02) // Device Wake
        }

        Method (_L04, 0, NotSerialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
        {
            Notify (\_SB.PCI0.USB1, 0x02) // Device Wake
            Notify (\_SB.PWRB, 0x02) // Device Wake
        }

        Method (_L0C, 0, NotSerialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
        {
            Notify (\_SB.PCI0.USB2, 0x02) // Device Wake
            Notify (\_SB.PWRB, 0x02) // Device Wake
        }

        Method (_L0E, 0, NotSerialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
        {
            Notify (\_SB.PCI0.USB3, 0x02) // Device Wake
            Notify (\_SB.PWRB, 0x02) // Device Wake
        }

        Method (_L0D, 0, NotSerialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
        {
            Notify (\_SB.PCI0.USBE, 0x02) // Device Wake
            Notify (\_SB.PWRB, 0x02) // Device Wake
        }

        Method (_L0B, 0, NotSerialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
        {
            Notify (\_SB.PCI0.HUB0, 0x02) // Device Wake
        }

        Method (_L09, 0, NotSerialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
        {
            Notify (\_SB.PCI0.PEX0, 0x02) // Device Wake
            Notify (\_SB.PCI0.PEX1, 0x02) // Device Wake
            Notify (\_SB.PCI0.PEX2, 0x02) // Device Wake
            Notify (\_SB.PCI0.PEX3, 0x02) // Device Wake
            Notify (\_SB.PCI0.PEX4, 0x02) // Device Wake
            Notify (\_SB.PCI0.PEX5, 0x02) // Device Wake
        }
    }

    Scope (\_SB)
    {
        Device (PWRB)
        {
            Name (_HID, EisaId ("PNP0C0C") /* Power Button Device */)  // _HID: Hardware ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0B)
            }
        }

        Device (PCI0)
        {
            Name (_HID, EisaId ("PNP0A03") /* PCI Bus */)  // _HID: Hardware ID
            Name (_ADR, 0x00)  // _ADR: Address
            Name (_UID, 0x01)  // _UID: Unique ID
            Name (_BBN, 0x00)  // _BBN: BIOS Bus Number
            Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
            {
                If ((OSFL == 0x02))
                {
                    Return (0x02)
                }
                Else
                {
                    Return (0x03)
                }
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (BUF0, ResourceTemplate ()
                {
                    WordBusNumber (ResourceConsumer, MinNotFixed, MaxNotFixed, PosDecode,
                        0x0000,             // Granularity
                        0x0000,             // Range Minimum
                        0x003F,             // Range Maximum
                        0x0000,             // Translation Offset
                        0x0040,             // Length
                        ,, )
                    IO (Decode16,
                        0x0CF8,             // Range Minimum
                        0x0CF8,             // Range Maximum
                        0x01,               // Alignment
                        0x08,               // Length
                        )
                    WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                        0x0000,             // Granularity
                        0x0000,             // Range Minimum
                        0x0CF7,             // Range Maximum
                        0x0000,             // Translation Offset
                        0x0CF8,             // Length
                        ,, , TypeStatic, DenseTranslation)
                    WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                        0x0000,             // Granularity
                        0x0D00,             // Range Minimum
                        0xFFFF,             // Range Maximum
                        0x0000,             // Translation Offset
                        0xF300,             // Length
                        ,, , TypeStatic, DenseTranslation)
                    DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                        0x00000000,         // Granularity
                        0x000A0000,         // Range Minimum
                        0x000BFFFF,         // Range Maximum
                        0x00000000,         // Translation Offset
                        0x00020000,         // Length
                        ,, , AddressRangeMemory, TypeStatic)
                    DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                        0x00000000,         // Granularity
                        0x000C0000,         // Range Minimum
                        0x000DFFFF,         // Range Maximum
                        0x00000000,         // Translation Offset
                        0x00020000,         // Length
                        ,, , AddressRangeMemory, TypeStatic)
                    DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                        0x00000000,         // Granularity
                        0x00100000,         // Range Minimum
                        0xFEBFFFFF,         // Range Maximum
                        0x00000000,         // Translation Offset
                        0xFFF00000,         // Length
                        ,, _Y00, AddressRangeMemory, TypeStatic)
                })
                CreateDWordField (BUF0, \_SB.PCI0._CRS._Y00._MIN, TCMM)  // _MIN: Minimum Base Address
                CreateDWordField (BUF0, \_SB.PCI0._CRS._Y00._LEN, TOMM)  // _LEN: Length
                TCMM = (AMEM + 0x00010000)
                TCMM += 0x00010000
                TOMM = (0xFEC00000 - TCMM) /* \_SB_.PCI0._CRS.TCMM */
                Return (BUF0) /* \_SB_.PCI0._CRS.BUF0 */
            }

            Name (PICM, Package (0x16)
            {
                Package (0x04)
                {
                    0x001BFFFF, 
                    0x00, 
                    \_SB.PCI0.LNKA, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    0x00, 
                    \_SB.PCI0.LNKA, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    0x01, 
                    \_SB.PCI0.LNKB, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    0x02, 
                    \_SB.PCI0.LNKC, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    0x03, 
                    \_SB.PCI0.LNKD, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0006FFFF, 
                    0x00, 
                    \_SB.PCI0.LNKA, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0006FFFF, 
                    0x01, 
                    \_SB.PCI0.LNKB, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0006FFFF, 
                    0x02, 
                    \_SB.PCI0.LNKC, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0006FFFF, 
                    0x03, 
                    \_SB.PCI0.LNKD, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    0x00, 
                    \_SB.PCI0.LNKA, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    0x01, 
                    \_SB.PCI0.LNKB, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    0x02, 
                    \_SB.PCI0.LNKC, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    0x03, 
                    \_SB.PCI0.LNKD, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    0x00, 
                    \_SB.PCI0.LNKA, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    0x01, 
                    \_SB.PCI0.LNKB, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x001DFFFF, 
                    0x00, 
                    \_SB.PCI0.LNK1, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x001DFFFF, 
                    0x01, 
                    \_SB.PCI0.LNKD, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x001DFFFF, 
                    0x02, 
                    \_SB.PCI0.LNKC, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x001DFFFF, 
                    0x03, 
                    \_SB.PCI0.LNKA, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x001FFFFF, 
                    0x00, 
                    \_SB.PCI0.LNKC, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x001FFFFF, 
                    0x01, 
                    \_SB.PCI0.LNKD, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x001FFFFF, 
                    0x01, 
                    \_SB.PCI0.LNKD, 
                    0x00
                }
            })
            Name (APIC, Package (0x16)
            {
                Package (0x04)
                {
                    0x001BFFFF, 
                    0x00, 
                    0x00, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    0x00, 
                    0x00, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    0x01, 
                    0x00, 
                    0x11
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    0x02, 
                    0x00, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    0x03, 
                    0x00, 
                    0x13
                }, 

                Package (0x04)
                {
                    0x0006FFFF, 
                    0x00, 
                    0x00, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x0006FFFF, 
                    0x01, 
                    0x00, 
                    0x11
                }, 

                Package (0x04)
                {
                    0x0006FFFF, 
                    0x02, 
                    0x00, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x0006FFFF, 
                    0x03, 
                    0x00, 
                    0x13
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    0x00, 
                    0x00, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    0x01, 
                    0x00, 
                    0x11
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    0x02, 
                    0x00, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    0x03, 
                    0x00, 
                    0x13
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    0x00, 
                    0x00, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    0x01, 
                    0x00, 
                    0x11
                }, 

                Package (0x04)
                {
                    0x001DFFFF, 
                    0x00, 
                    0x00, 
                    0x17
                }, 

                Package (0x04)
                {
                    0x001DFFFF, 
                    0x01, 
                    0x00, 
                    0x13
                }, 

                Package (0x04)
                {
                    0x001DFFFF, 
                    0x02, 
                    0x00, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x001DFFFF, 
                    0x03, 
                    0x00, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x001FFFFF, 
                    0x00, 
                    0x00, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x001FFFFF, 
                    0x01, 
                    0x00, 
                    0x13
                }, 

                Package (0x04)
                {
                    0x001FFFFF, 
                    0x01, 
                    0x00, 
                    0x13
                }
            })
            Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
            {
                If (!PICF)
                {
                    Return (PICM) /* \_SB_.PCI0.PICM */
                }
                Else
                {
                    Return (APIC) /* \_SB_.PCI0.APIC */
                }
            }

            Device (PEX0)
            {
                Name (_ADR, 0x001C0000)  // _ADR: Address
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (Package (0x02)
                    {
                        0x09, 
                        0x05
                    })
                }

                Name (PIC0, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x00, 
                        \_SB.PCI0.LNKA, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x01, 
                        \_SB.PCI0.LNKB, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        \_SB.PCI0.LNKC, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        \_SB.PCI0.LNKD, 
                        0x00
                    }
                })
                Name (API0, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x00, 
                        0x00, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x01, 
                        0x00, 
                        0x11
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        0x00, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        0x00, 
                        0x13
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (!PICF)
                    {
                        Return (PIC0) /* \_SB_.PCI0.PEX0.PIC0 */
                    }
                    Else
                    {
                        Return (API0) /* \_SB_.PCI0.PEX0.API0 */
                    }
                }
            }

            Device (PEX1)
            {
                Name (_ADR, 0x001C0001)  // _ADR: Address
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (Package (0x02)
                    {
                        0x09, 
                        0x05
                    })
                }

                Name (PIC1, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x00, 
                        \_SB.PCI0.LNKB, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x01, 
                        \_SB.PCI0.LNKC, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        \_SB.PCI0.LNKD, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        \_SB.PCI0.LNKA, 
                        0x00
                    }
                })
                Name (API1, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x00, 
                        0x00, 
                        0x11
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x01, 
                        0x00, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        0x00, 
                        0x13
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        0x00, 
                        0x10
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (!PICF)
                    {
                        Return (PIC1) /* \_SB_.PCI0.PEX1.PIC1 */
                    }
                    Else
                    {
                        Return (API1) /* \_SB_.PCI0.PEX1.API1 */
                    }
                }
            }

            Device (PEX2)
            {
                Name (_ADR, 0x001C0002)  // _ADR: Address
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (Package (0x02)
                    {
                        0x09, 
                        0x05
                    })
                }

                Name (PIC2, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x00, 
                        \_SB.PCI0.LNKC, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x01, 
                        \_SB.PCI0.LNKD, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        \_SB.PCI0.LNKA, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        \_SB.PCI0.LNKB, 
                        0x00
                    }
                })
                Name (API2, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x00, 
                        0x00, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x01, 
                        0x00, 
                        0x13
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        0x00, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        0x00, 
                        0x11
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (!PICF)
                    {
                        Return (PIC2) /* \_SB_.PCI0.PEX2.PIC2 */
                    }
                    Else
                    {
                        Return (API2) /* \_SB_.PCI0.PEX2.API2 */
                    }
                }
            }

            Device (PEX3)
            {
                Name (_ADR, 0x001C0003)  // _ADR: Address
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (Package (0x02)
                    {
                        0x09, 
                        0x05
                    })
                }

                Name (PIC3, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x00, 
                        \_SB.PCI0.LNKD, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x01, 
                        \_SB.PCI0.LNKA, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        \_SB.PCI0.LNKB, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        \_SB.PCI0.LNKC, 
                        0x00
                    }
                })
                Name (API3, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x00, 
                        0x00, 
                        0x13
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x01, 
                        0x00, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        0x00, 
                        0x11
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        0x00, 
                        0x12
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (!PICF)
                    {
                        Return (PIC3) /* \_SB_.PCI0.PEX3.PIC3 */
                    }
                    Else
                    {
                        Return (API3) /* \_SB_.PCI0.PEX3.API3 */
                    }
                }
            }

            Device (PEX4)
            {
                Name (_ADR, 0x001C0004)  // _ADR: Address
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (Package (0x02)
                    {
                        0x09, 
                        0x05
                    })
                }

                Name (PIC4, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x00, 
                        \_SB.PCI0.LNKA, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x01, 
                        \_SB.PCI0.LNKB, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        \_SB.PCI0.LNKC, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        \_SB.PCI0.LNKD, 
                        0x00
                    }
                })
                Name (API4, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x00, 
                        0x00, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x01, 
                        0x00, 
                        0x11
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        0x00, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        0x00, 
                        0x13
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (!PICF)
                    {
                        Return (PIC4) /* \_SB_.PCI0.PEX4.PIC4 */
                    }
                    Else
                    {
                        Return (API4) /* \_SB_.PCI0.PEX4.API4 */
                    }
                }
            }

            Device (PEX5)
            {
                Name (_ADR, 0x001C0005)  // _ADR: Address
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (Package (0x02)
                    {
                        0x09, 
                        0x05
                    })
                }

                Name (PIC5, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x00, 
                        \_SB.PCI0.LNKB, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x01, 
                        \_SB.PCI0.LNKC, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        \_SB.PCI0.LNKD, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        \_SB.PCI0.LNKA, 
                        0x00
                    }
                })
                Name (API5, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x00, 
                        0x00, 
                        0x11
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x01, 
                        0x00, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        0x00, 
                        0x13
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        0x00, 
                        0x10
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (!PICF)
                    {
                        Return (PIC5) /* \_SB_.PCI0.PEX5.PIC5 */
                    }
                    Else
                    {
                        Return (API5) /* \_SB_.PCI0.PEX5.API5 */
                    }
                }
            }

            Device (HUB0)
            {
                Name (_ADR, 0x001E0000)  // _ADR: Address
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Name (PICM, Package (0x0C)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x00, 
                        \_SB.PCI0.LNKE, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x01, 
                        \_SB.PCI0.LNKD, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        \_SB.PCI0.LNKC, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        \_SB.PCI0.LNKA, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0001FFFF, 
                        0x00, 
                        \_SB.PCI0.LNKD, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0001FFFF, 
                        0x01, 
                        \_SB.PCI0.LNKC, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0001FFFF, 
                        0x02, 
                        \_SB.PCI0.LNKA, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0001FFFF, 
                        0x03, 
                        \_SB.PCI0.LNKE, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0002FFFF, 
                        0x00, 
                        \_SB.PCI0.LNKC, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0002FFFF, 
                        0x01, 
                        \_SB.PCI0.LNKA, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0002FFFF, 
                        0x02, 
                        \_SB.PCI0.LNKE, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0002FFFF, 
                        0x03, 
                        \_SB.PCI0.LNKD, 
                        0x00
                    }
                })
                Name (APIC, Package (0x0C)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x00, 
                        0x00, 
                        0x14
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x01, 
                        0x00, 
                        0x13
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        0x00, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        0x00, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0x0001FFFF, 
                        0x00, 
                        0x00, 
                        0x13
                    }, 

                    Package (0x04)
                    {
                        0x0001FFFF, 
                        0x01, 
                        0x00, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0x0001FFFF, 
                        0x02, 
                        0x00, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0x0001FFFF, 
                        0x03, 
                        0x00, 
                        0x14
                    }, 

                    Package (0x04)
                    {
                        0x0002FFFF, 
                        0x00, 
                        0x00, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0x0002FFFF, 
                        0x01, 
                        0x00, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0x0002FFFF, 
                        0x02, 
                        0x00, 
                        0x14
                    }, 

                    Package (0x04)
                    {
                        0x0002FFFF, 
                        0x03, 
                        0x00, 
                        0x13
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (!PICF)
                    {
                        Return (PICM) /* \_SB_.PCI0.HUB0.PICM */
                    }
                    Else
                    {
                        Return (APIC) /* \_SB_.PCI0.HUB0.APIC */
                    }
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (Package (0x02)
                    {
                        0x0B, 
                        0x05
                    })
                }
            }

            Device (PX40)
            {
                Name (_ADR, 0x001F0000)  // _ADR: Address
                OperationRegion (PREV, PCI_Config, 0x08, 0x01)
                Scope (\)
                {
                    Field (\_SB.PCI0.PX40.PREV, ByteAcc, NoLock, Preserve)
                    {
                        REV0,   8
                    }
                }

                OperationRegion (PIRQ, PCI_Config, 0x60, 0x04)
                Scope (\)
                {
                    Field (\_SB.PCI0.PX40.PIRQ, ByteAcc, NoLock, Preserve)
                    {
                        PIRA,   8, 
                        PIRB,   8, 
                        PIRC,   8, 
                        PIRD,   8
                    }
                }

                OperationRegion (PIR2, PCI_Config, 0x68, 0x04)
                Scope (\)
                {
                    Field (\_SB.PCI0.PX40.PIR2, ByteAcc, NoLock, Preserve)
                    {
                        PIRE,   8, 
                        PIRF,   8, 
                        PIRG,   8, 
                        PIRH,   8
                    }
                }

                OperationRegion (LPIO, PCI_Config, 0x80, 0x0E)
                Scope (\)
                {
                    Field (\_SB.PCI0.PX40.LPIO, ByteAcc, NoLock, Preserve)
                    {
                        UAIO,   8, 
                        PRIO,   8, 
                        LPE1,   8, 
                        LPE2,   8, 
                        GN1L,   8, 
                        GN1H,   8, 
                        GN2L,   8, 
                        GN2H,   8
                    }

                    Method (DISD, 1, NotSerialized)
                    {
                        If ((Arg0 == 0x00))
                        {
                            LPE1 &= 0xFE
                        }

                        If ((Arg0 == 0x01))
                        {
                            LPE1 &= 0xFD
                        }

                        If ((Arg0 == 0x02))
                        {
                            LPE1 &= 0xFB
                        }

                        If ((Arg0 == 0x03))
                        {
                            LPE1 &= 0xF7
                        }

                        If ((Arg0 == 0x04))
                        {
                            LPE2 &= 0xFC
                        }

                        If ((Arg0 == 0x05))
                        {
                            LPE1 &= 0xDF
                        }

                        If ((Arg0 == 0x06))
                        {
                            GN2L &= 0xFE
                        }
                    }

                    Method (CKIO, 2, NotSerialized)
                    {
                        If ((Arg1 == 0x00))
                        {
                            LPE1 |= 0x01
                            Local0 = (UAIO & 0xF0)
                            If ((Arg0 == 0x03F8))
                            {
                                UAIO = (Local0 | 0x00)
                            }

                            If ((Arg0 == 0x02F8))
                            {
                                UAIO = (Local0 | 0x01)
                            }

                            If ((Arg0 == 0x02E8))
                            {
                                UAIO = (Local0 | 0x05)
                            }

                            If ((Arg0 == 0x03E8))
                            {
                                UAIO = (Local0 | 0x07)
                            }
                        }

                        If ((Arg1 == 0x01))
                        {
                            LPE1 |= 0x02
                            Local0 = (UAIO & 0x0F)
                            If ((Arg0 == 0x03F8))
                            {
                                UAIO = (Local0 | 0x00)
                            }

                            If ((Arg0 == 0x02F8))
                            {
                                UAIO = (Local0 | 0x10)
                            }

                            If ((Arg0 == 0x02E8))
                            {
                                UAIO = (Local0 | 0x50)
                            }

                            If ((Arg0 == 0x03E8))
                            {
                                UAIO = (Local0 | 0x70)
                            }
                        }

                        If ((Arg1 == 0x02))
                        {
                            LPE1 |= 0x04
                            Local0 = (PRIO & 0xFC)
                            If ((Arg0 == 0x0378))
                            {
                                PRIO = (Local0 | 0x00)
                            }

                            If ((Arg0 == 0x0278))
                            {
                                PRIO = (Local0 | 0x01)
                            }

                            If ((Arg0 == 0x03BC))
                            {
                                PRIO = (Local0 | 0x02)
                            }
                        }

                        If ((Arg1 == 0x03))
                        {
                            LPE1 |= 0x08
                        }

                        If ((Arg1 == 0x04))
                        {
                            If ((Arg0 == 0x0201))
                            {
                                LPE2 |= 0x01
                            }

                            If ((Arg0 == 0x0209))
                            {
                                LPE2 |= 0x02
                            }
                        }

                        If ((Arg1 == 0x06))
                        {
                            If ((Arg0 != 0xFFFF))
                            {
                                Local0 = (Arg0 & 0xFF)
                                GN2L = (Local0 | 0x01)
                                GN2H = (Arg0 >> 0x08)
                            }
                            Else
                            {
                                GN2H = Zero
                                GN2L = Zero
                            }
                        }
                    }
                }

                Scope (\)
                {
                    Method (SLDM, 2, NotSerialized)
                    {
                    }
                }

                Scope (\)
                {
                    OperationRegion (\SCPP, SystemIO, 0xB2, 0x01)
                    Field (\SCPP, ByteAcc, NoLock, Preserve)
                    {
                        SMIP,   8
                    }
                }

                Method (\_SB.PCI0._INI, 0, NotSerialized)  // _INI: Initialize
                {
                    If (STRC (\_OS, "Microsoft Windows"))
                    {
                        SMIP = 0x56
                    }
                    ElseIf (STRC (\_OS, "Microsoft Windows NT"))
                    {
                        If (CondRefOf (\_OSI, Local0))
                        {
                            Local2 = 0x00
                            If (\_OSI ("Windows 2001"))
                            {
                                OSFL = 0x00
                                Local1 = 0x59
                                OSFX = 0x03
                                Local2 = 0x01
                            }

                            If (\_OSI ("Windows 2006")) {}
                            If (\_OSI ("Windows 2009")) {}
                            If ((Local2 != 0x00))
                            {
                                SMIP = Local1
                            }
                        }
                        Else
                        {
                            SMIP = 0x58
                            OSFL = 0x00
                        }
                    }
                    Else
                    {
                        If (CondRefOf (\_OSI, Local0))
                        {
                            If (\_OSI ("Linux"))
                            {
                                LINX = 0x01
                            }

                            If (\_OSI ("Darwin"))
                            {
                                AMAC = 0x01
                            }
                        }

                        SMIP = 0x57
                        OSFL = 0x02
                    }
                }

                Scope (\)
                {
                    Method (OSTP, 0, NotSerialized)
                    {
                        If ((OSFL == 0x01))
                        {
                            SMIP = 0x56
                        }

                        If ((OSFL == 0x02))
                        {
                            SMIP = 0x57
                        }

                        If ((OSFL == 0x00))
                        {
                            Local1 = 0x58
                            If ((OSFX >= 0x03))
                            {
                                Local1 = 0x59
                            }

                            SMIP = Local1
                        }
                    }
                }

                Device (SYSR)
                {
                    Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
                    Name (_UID, 0x01)  // _UID: Unique ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0010,             // Range Minimum
                            0x0010,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0022,             // Range Minimum
                            0x0022,             // Range Maximum
                            0x01,               // Alignment
                            0x1E,               // Length
                            )
                        IO (Decode16,
                            0x0044,             // Range Minimum
                            0x0044,             // Range Maximum
                            0x01,               // Alignment
                            0x1C,               // Length
                            )
                        IO (Decode16,
                            0x0062,             // Range Minimum
                            0x0062,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0065,             // Range Minimum
                            0x0065,             // Range Maximum
                            0x01,               // Alignment
                            0x0B,               // Length
                            )
                        IO (Decode16,
                            0x0074,             // Range Minimum
                            0x0074,             // Range Maximum
                            0x01,               // Alignment
                            0x0C,               // Length
                            )
                        IO (Decode16,
                            0x0091,             // Range Minimum
                            0x0091,             // Range Maximum
                            0x01,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x00A2,             // Range Minimum
                            0x00A2,             // Range Maximum
                            0x01,               // Alignment
                            0x1E,               // Length
                            )
                        IO (Decode16,
                            0x00E0,             // Range Minimum
                            0x00E0,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x04D0,             // Range Minimum
                            0x04D0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0290,             // Range Minimum
                            0x0290,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0800,             // Range Minimum
                            0x0800,             // Range Maximum
                            0x01,               // Alignment
                            0x80,               // Length
                            )
                        IO (Decode16,
                            0x0290,             // Range Minimum
                            0x0290,             // Range Maximum
                            0x01,               // Alignment
                            0x05,               // Length
                            )
                        IO (Decode16,
                            0x0880,             // Range Minimum
                            0x0880,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                    })
                }

                Device (PIC)
                {
                    Name (_HID, EisaId ("PNP0000") /* 8259-compatible Programmable Interrupt Controller */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0020,             // Range Minimum
                            0x0020,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A0,             // Range Minimum
                            0x00A0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IRQNoFlags ()
                            {2}
                    })
                }

                Device (DMA1)
                {
                    Name (_HID, EisaId ("PNP0200") /* PC-class DMA Controller */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        DMA (Compatibility, BusMaster, Transfer8, )
                            {4}
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0080,             // Range Minimum
                            0x0080,             // Range Maximum
                            0x01,               // Alignment
                            0x11,               // Length
                            )
                        IO (Decode16,
                            0x0094,             // Range Minimum
                            0x0094,             // Range Maximum
                            0x01,               // Alignment
                            0x0C,               // Length
                            )
                        IO (Decode16,
                            0x00C0,             // Range Minimum
                            0x00C0,             // Range Maximum
                            0x01,               // Alignment
                            0x20,               // Length
                            )
                    })
                }

                Device (TMR)
                {
                    Name (_HID, EisaId ("PNP0100") /* PC-class System Timer */)  // _HID: Hardware ID
                    Name (ATT5, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0040,             // Range Minimum
                            0x0040,             // Range Maximum
                            0x00,               // Alignment
                            0x04,               // Length
                            )
                        IRQNoFlags ()
                            {0}
                    })
                    Name (ATT6, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0040,             // Range Minimum
                            0x0040,             // Range Maximum
                            0x00,               // Alignment
                            0x04,               // Length
                            )
                    })
                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        If ((OSFX >= 0x03))
                        {
                            If (HPTF)
                            {
                                Return (ATT6) /* \_SB_.PCI0.PX40.TMR_.ATT6 */
                            }
                            Else
                            {
                                Return (ATT5) /* \_SB_.PCI0.PX40.TMR_.ATT5 */
                            }
                        }
                        Else
                        {
                            Return (ATT5) /* \_SB_.PCI0.PX40.TMR_.ATT5 */
                        }
                    }
                }

                Device (HPET)
                {
                    Name (_HID, EisaId ("PNP0103") /* HPET System Timer */)  // _HID: Hardware ID
                    Name (ATT3, ResourceTemplate ()
                    {
                        IRQNoFlags ()
                            {0}
                        IRQNoFlags ()
                            {8}
                        Memory32Fixed (ReadWrite,
                            0xFED00000,         // Address Base
                            0x00000400,         // Address Length
                            )
                    })
                    Name (ATT4, Buffer (0x02)
                    {
                         0x79, 0x00                                       // y.
                    })
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If ((OSFX >= 0x03))
                        {
                            If (HPTF)
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }
                        Else
                        {
                            Return (0x00)
                        }
                    }

                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        If ((OSFX >= 0x03))
                        {
                            If (HPTF)
                            {
                                Return (ATT3) /* \_SB_.PCI0.PX40.HPET.ATT3 */
                            }
                            Else
                            {
                                Return (ATT4) /* \_SB_.PCI0.PX40.HPET.ATT4 */
                            }
                        }
                        Else
                        {
                            Return (ATT4) /* \_SB_.PCI0.PX40.HPET.ATT4 */
                        }
                    }
                }

                Device (RTC)
                {
                    Name (_HID, EisaId ("PNP0B00") /* AT Real-Time Clock */)  // _HID: Hardware ID
                    Name (ATT0, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x00,               // Alignment
                            0x04,               // Length
                            )
                        IRQNoFlags ()
                            {8}
                    })
                    Name (ATT1, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x00,               // Alignment
                            0x04,               // Length
                            )
                    })
                    Name (ATT2, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IRQNoFlags ()
                            {8}
                    })
                    Name (ATT3, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                    })
                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        If ((OSFX >= 0x03))
                        {
                            If (HPTF)
                            {
                                Return (ATT1) /* \_SB_.PCI0.PX40.RTC_.ATT1 */
                            }
                            Else
                            {
                                Return (ATT0) /* \_SB_.PCI0.PX40.RTC_.ATT0 */
                            }
                        }
                        Else
                        {
                            If ((AMAC == 0x01))
                            {
                                Return (ATT2) /* \_SB_.PCI0.PX40.RTC_.ATT2 */
                            }

                            Return (ATT0) /* \_SB_.PCI0.PX40.RTC_.ATT0 */
                        }
                    }
                }

                Device (SPKR)
                {
                    Name (_HID, EisaId ("PNP0800") /* Microsoft Sound System Compatible Device */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0061,             // Range Minimum
                            0x0061,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                    })
                }

                Device (COPR)
                {
                    Name (_HID, EisaId ("PNP0C04") /* x87-compatible Floating Point Processing Unit */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x00F0,             // Range Minimum
                            0x00F0,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IRQNoFlags ()
                            {13}
                    })
                }

                Scope (\)
                {
                    OperationRegion (WIN1, SystemIO, 0x2E, 0x02)
                    Field (WIN1, ByteAcc, NoLock, Preserve)
                    {
                        INDP,   8, 
                        DATP,   8
                    }

                    OperationRegion (GPIO, SystemIO, 0x0800, 0x05)
                    Field (GPIO, ByteAcc, NoLock, Preserve)
                    {
                        GO01,   8, 
                        GO02,   8, 
                        GO03,   8, 
                        GO04,   8, 
                        GO05,   8
                    }

                    IndexField (INDP, DATP, ByteAcc, NoLock, Preserve)
                    {
                        Offset (0x02), 
                        CFG,    8, 
                        Offset (0x07), 
                        LDN,    8, 
                        Offset (0x20), 
                        IDHI,   8, 
                        IDLO,   8, 
                        POWC,   8, 
                        Offset (0x30), 
                        ACTR,   8, 
                        Offset (0x60), 
                        IOAH,   8, 
                        IOAL,   8, 
                        IO2H,   8, 
                        IO2L,   8, 
                        Offset (0x70), 
                        INTR,   8, 
                        Offset (0x72), 
                        INT1,   8, 
                        Offset (0x74), 
                        DMCH,   8, 
                        Offset (0xC0), 
                        GP40,   8, 
                        Offset (0xF0), 
                        OPT1,   8, 
                        OPT2,   8, 
                        OPT3,   8, 
                        OPT4,   8
                    }

                    Method (ENFG, 0, NotSerialized)
                    {
                        INDP = 0x87
                        INDP = 0x01
                        INDP = 0x55
                        INDP = 0x55
                    }

                    Method (EXFG, 0, NotSerialized)
                    {
                        CFG = 0x02
                    }

                    Method (GSRG, 1, NotSerialized)
                    {
                        INDP = Arg0
                        Return (DATP) /* \DATP */
                    }

                    Method (SSRG, 2, NotSerialized)
                    {
                        INDP = Arg0
                        DATP = Arg1
                    }
                }

                Device (FDC0)
                {
                    Name (_HID, EisaId ("PNP0700"))  // _HID: Hardware ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        ENFG ()
                        LDN = Zero
                        If (ACTR)
                        {
                            EXFG ()
                            Return (0x0F)
                        }
                        ElseIf ((IOAH || IOAL))
                        {
                            EXFG ()
                            Return (0x0D)
                        }
                        Else
                        {
                            EXFG ()
                            Return (0x00)
                        }
                    }

                    Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                    {
                        ENFG ()
                        LDN = 0x00
                        ACTR = Zero
                        SLDM (DMCH, 0x04)
                        EXFG ()
                        DISD (0x03)
                    }

                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x03F0,             // Range Minimum
                                0x03F0,             // Range Maximum
                                0x01,               // Alignment
                                0x06,               // Length
                                _Y01)
                            IO (Decode16,
                                0x03F7,             // Range Minimum
                                0x03F7,             // Range Maximum
                                0x01,               // Alignment
                                0x01,               // Length
                                )
                            IRQNoFlags ()
                                {6}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {2}
                        })
                        CreateByteField (BUF0, \_SB.PCI0.PX40.FDC0._CRS._Y01._MIN, IOLO)  // _MIN: Minimum Base Address
                        CreateByteField (BUF0, 0x03, IOHI)
                        CreateByteField (BUF0, \_SB.PCI0.PX40.FDC0._CRS._Y01._MAX, IORL)  // _MAX: Maximum Base Address
                        CreateByteField (BUF0, 0x05, IORH)
                        ENFG ()
                        EXFG ()
                        Return (BUF0) /* \_SB_.PCI0.PX40.FDC0._CRS.BUF0 */
                    }

                    Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
                    {
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x03F0,             // Range Minimum
                                0x03F0,             // Range Maximum
                                0x01,               // Alignment
                                0x06,               // Length
                                )
                            IO (Decode16,
                                0x03F7,             // Range Minimum
                                0x03F7,             // Range Maximum
                                0x01,               // Alignment
                                0x01,               // Length
                                )
                            IRQNoFlags ()
                                {6}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {2}
                        }
                        EndDependentFn ()
                    })
                    Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
                    {
                        CreateByteField (Arg0, 0x02, IOLO)
                        CreateByteField (Arg0, 0x03, IOHI)
                        CreateWordField (Arg0, 0x02, IOAD)
                        CreateWordField (Arg0, 0x19, IRQW)
                        CreateByteField (Arg0, 0x1C, DMAV)
                        ENFG ()
                        LDN = Zero
                        ACTR = One
                        SLDM (DMCH, DMCH)
                        CKIO (IOAD, 0x03)
                        EXFG ()
                    }
                }

                Device (UAR1)
                {
                    Name (_HID, EisaId ("PNP0501") /* 16550A-compatible COM Serial Port */)  // _HID: Hardware ID
                    Name (_UID, 0x01)  // _UID: Unique ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        ENFG ()
                        LDN = 0x01
                        If (ACTR)
                        {
                            EXFG ()
                            Return (0x0F)
                        }
                        ElseIf ((IOAH || IOAL))
                        {
                            EXFG ()
                            Return (0x0D)
                        }
                        Else
                        {
                            EXFG ()
                            Return (0x00)
                        }

                        EXFG ()
                    }

                    Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                    {
                        ENFG ()
                        LDN = 0x01
                        ACTR = Zero
                        EXFG ()
                        DISD (0x00)
                    }

                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        Name (BUF1, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x0000,             // Range Minimum
                                0x0000,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                _Y02)
                            IRQNoFlags (_Y03)
                                {}
                        })
                        CreateByteField (BUF1, \_SB.PCI0.PX40.UAR1._CRS._Y02._MIN, IOLO)  // _MIN: Minimum Base Address
                        CreateByteField (BUF1, 0x03, IOHI)
                        CreateByteField (BUF1, \_SB.PCI0.PX40.UAR1._CRS._Y02._MAX, IORL)  // _MAX: Maximum Base Address
                        CreateByteField (BUF1, 0x05, IORH)
                        CreateWordField (BUF1, \_SB.PCI0.PX40.UAR1._CRS._Y03._INT, IRQW)  // _INT: Interrupts
                        ENFG ()
                        LDN = 0x01
                        IOLO = IOAL /* \IOAL */
                        IORL = IOAL /* \IOAL */
                        IOHI = IOAH /* \IOAH */
                        IORH = IOAH /* \IOAH */
                        Local0 = One
                        IRQW = (Local0 << INTR) /* \INTR */
                        EXFG ()
                        Return (BUF1) /* \_SB_.PCI0.PX40.UAR1._CRS.BUF1 */
                    }

                    Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
                    {
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x03F8,             // Range Minimum
                                0x03F8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4,5,7,9,10,11,12}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x02F8,             // Range Minimum
                                0x02F8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4,5,7,9,10,11,12}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x03E8,             // Range Minimum
                                0x03E8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4,5,7,9,10,11,12}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x02E8,             // Range Minimum
                                0x02E8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4,5,7,9,10,11,12}
                        }
                        EndDependentFn ()
                    })
                    Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
                    {
                        CreateByteField (Arg0, 0x02, IOLO)
                        CreateByteField (Arg0, 0x03, IOHI)
                        CreateWordField (Arg0, 0x02, IOAD)
                        CreateWordField (Arg0, 0x09, IRQW)
                        ENFG ()
                        LDN = 0x01
                        ACTR = One
                        IOAL = IOLO /* \_SB_.PCI0.PX40.UAR1._SRS.IOLO */
                        IOAH = IOHI /* \_SB_.PCI0.PX40.UAR1._SRS.IOHI */
                        FindSetRightBit (IRQW, Local0)
                        INTR = (Local0 - 0x01)
                        EXFG ()
                        CKIO (IOAD, 0x00)
                    }

                    Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                    {
                        If (SUSF)
                        {
                            Return (Package (0x02)
                            {
                                0x08, 
                                0x03
                            })
                        }
                        Else
                        {
                            Return (Package (0x02)
                            {
                                0x08, 
                                0x01
                            })
                        }
                    }

                    Method (_PSW, 1, NotSerialized)  // _PSW: Power State Wake
                    {
                        If (Arg0)
                        {
                            G2C2 |= 0x01
                        }
                        Else
                        {
                            G2C2 &= 0xFE
                        }
                    }
                }

                Device (LPT1)
                {
                    Name (_HID, EisaId ("PNP0400") /* Standard LPT Parallel Port */)  // _HID: Hardware ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        ENFG ()
                        LDN = 0x03
                        Local0 = (OPT1 & 0x02)
                        If ((Local0 != 0x02))
                        {
                            If (ACTR)
                            {
                                EXFG ()
                                Return (0x0F)
                            }
                            ElseIf ((IOAH || IOAL))
                            {
                                EXFG ()
                                Return (0x0D)
                            }
                            Else
                            {
                                EXFG ()
                                Return (0x00)
                            }
                        }
                        Else
                        {
                            EXFG ()
                            Return (0x00)
                        }
                    }

                    Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                    {
                        ENFG ()
                        LDN = 0x03
                        ACTR = Zero
                        EXFG ()
                        DISD (0x02)
                    }

                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        Name (BUF5, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x0000,             // Range Minimum
                                0x0000,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                _Y04)
                            IRQNoFlags (_Y05)
                                {}
                        })
                        CreateByteField (BUF5, \_SB.PCI0.PX40.LPT1._CRS._Y04._MIN, IOLO)  // _MIN: Minimum Base Address
                        CreateByteField (BUF5, 0x03, IOHI)
                        CreateByteField (BUF5, \_SB.PCI0.PX40.LPT1._CRS._Y04._MAX, IORL)  // _MAX: Maximum Base Address
                        CreateByteField (BUF5, 0x05, IORH)
                        CreateByteField (BUF5, \_SB.PCI0.PX40.LPT1._CRS._Y04._LEN, IOLE)  // _LEN: Length
                        CreateWordField (BUF5, \_SB.PCI0.PX40.LPT1._CRS._Y05._INT, IRQW)  // _INT: Interrupts
                        ENFG ()
                        LDN = 0x03
                        IOLO = IOAL /* \IOAL */
                        IORL = IOLO /* \_SB_.PCI0.PX40.LPT1._CRS.IOLO */
                        IOHI = IOAH /* \IOAH */
                        IORH = IOHI /* \_SB_.PCI0.PX40.LPT1._CRS.IOHI */
                        If ((IOLO == 0xBC))
                        {
                            IOLE = 0x04
                        }
                        Else
                        {
                            IOLE = 0x08
                        }

                        Local0 = One
                        Local5 = INTR /* \INTR */
                        IRQW = (Local0 << Local5)
                        EXFG ()
                        Return (BUF5) /* \_SB_.PCI0.PX40.LPT1._CRS.BUF5 */
                    }

                    Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
                    {
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x0378,             // Range Minimum
                                0x0378,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4,5,7,9,10,11,12}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x0278,             // Range Minimum
                                0x0278,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4,5,7,9,10,11,12}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x03BC,             // Range Minimum
                                0x03BC,             // Range Maximum
                                0x01,               // Alignment
                                0x04,               // Length
                                )
                            IRQNoFlags ()
                                {3,4,5,7,9,10,11,12}
                        }
                        EndDependentFn ()
                    })
                    Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
                    {
                        CreateByteField (Arg0, 0x02, IOLO)
                        CreateByteField (Arg0, 0x03, IOHI)
                        CreateWordField (Arg0, 0x02, IOAD)
                        CreateByteField (Arg0, 0x04, IORL)
                        CreateByteField (Arg0, 0x05, IORH)
                        CreateWordField (Arg0, 0x09, IRQW)
                        ENFG ()
                        LDN = 0x03
                        ACTR = One
                        IOAL = IOLO /* \_SB_.PCI0.PX40.LPT1._SRS.IOLO */
                        IOAH = IOHI /* \_SB_.PCI0.PX40.LPT1._SRS.IOHI */
                        FindSetLeftBit (IRQW, Local0)
                        Local0 -= 0x01
                        INTR = Local0
                        EXFG ()
                        CKIO (IOAD, 0x02)
                    }
                }

                Device (ECP1)
                {
                    Name (_HID, EisaId ("PNP0401") /* ECP Parallel Port */)  // _HID: Hardware ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        ENFG ()
                        LDN = 0x03
                        Local0 = (OPT1 & 0x02)
                        If ((Local0 == 0x02))
                        {
                            If (ACTR)
                            {
                                EXFG ()
                                Return (0x0F)
                            }
                            ElseIf ((IOAH || IOAL))
                            {
                                EXFG ()
                                Return (0x0D)
                            }
                            Else
                            {
                                EXFG ()
                                Return (0x00)
                            }
                        }
                        Else
                        {
                            EXFG ()
                            Return (0x00)
                        }
                    }

                    Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                    {
                        ENFG ()
                        LDN = 0x03
                        ACTR = Zero
                        SLDM (DMCH, 0x04)
                        EXFG ()
                        DISD (0x02)
                    }

                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        Name (BUF6, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x0000,             // Range Minimum
                                0x0000,             // Range Maximum
                                0x01,               // Alignment
                                0x04,               // Length
                                _Y06)
                            IO (Decode16,
                                0x0000,             // Range Minimum
                                0x0000,             // Range Maximum
                                0x01,               // Alignment
                                0x04,               // Length
                                _Y07)
                            IRQNoFlags (_Y08)
                                {}
                            DMA (Compatibility, NotBusMaster, Transfer8, _Y09)
                                {}
                        })
                        CreateByteField (BUF6, \_SB.PCI0.PX40.ECP1._CRS._Y06._MIN, IOLO)  // _MIN: Minimum Base Address
                        CreateByteField (BUF6, 0x03, IOHI)
                        CreateByteField (BUF6, \_SB.PCI0.PX40.ECP1._CRS._Y06._MAX, IORL)  // _MAX: Maximum Base Address
                        CreateByteField (BUF6, 0x05, IORH)
                        CreateByteField (BUF6, \_SB.PCI0.PX40.ECP1._CRS._Y06._LEN, IOLE)  // _LEN: Length
                        CreateByteField (BUF6, \_SB.PCI0.PX40.ECP1._CRS._Y07._MIN, IOEL)  // _MIN: Minimum Base Address
                        CreateByteField (BUF6, 0x0B, IOEH)
                        CreateByteField (BUF6, \_SB.PCI0.PX40.ECP1._CRS._Y07._MAX, IOML)  // _MAX: Maximum Base Address
                        CreateByteField (BUF6, 0x0D, IOMH)
                        CreateWordField (BUF6, \_SB.PCI0.PX40.ECP1._CRS._Y08._INT, IRQW)  // _INT: Interrupts
                        CreateByteField (BUF6, \_SB.PCI0.PX40.ECP1._CRS._Y09._DMA, DMAC)  // _DMA: Direct Memory Access
                        ENFG ()
                        LDN = 0x03
                        Local2 = IOAL /* \IOAL */
                        IOLO = Local2
                        Local3 = IOAH /* \IOAH */
                        IOHI = Local3
                        Local3 |= 0x04
                        IOEH = Local3
                        IOMH = Local3
                        IORL = IOLO /* \_SB_.PCI0.PX40.ECP1._CRS.IOLO */
                        IOEL = IOLO /* \_SB_.PCI0.PX40.ECP1._CRS.IOLO */
                        IOML = IOLO /* \_SB_.PCI0.PX40.ECP1._CRS.IOLO */
                        IORH = IOHI /* \_SB_.PCI0.PX40.ECP1._CRS.IOHI */
                        If ((IOLO == 0xBC))
                        {
                            IOLE = 0x04
                        }
                        Else
                        {
                            IOLE = 0x08
                        }

                        Local0 = One
                        Local5 = INTR /* \INTR */
                        IRQW = (Local0 << Local5)
                        Local0 = One
                        Local5 = DMCH /* \DMCH */
                        DMAC = (Local0 << Local5)
                        EXFG ()
                        Return (BUF6) /* \_SB_.PCI0.PX40.ECP1._CRS.BUF6 */
                    }

                    Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
                    {
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x0378,             // Range Minimum
                                0x0378,             // Range Maximum
                                0x00,               // Alignment
                                0x08,               // Length
                                )
                            IO (Decode16,
                                0x0778,             // Range Minimum
                                0x0778,             // Range Maximum
                                0x00,               // Alignment
                                0x04,               // Length
                                )
                            IRQNoFlags ()
                                {3,4,5,7,9,10,11,12}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {0,1,3}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x0278,             // Range Minimum
                                0x0278,             // Range Maximum
                                0x00,               // Alignment
                                0x08,               // Length
                                )
                            IO (Decode16,
                                0x0678,             // Range Minimum
                                0x0678,             // Range Maximum
                                0x00,               // Alignment
                                0x04,               // Length
                                )
                            IRQNoFlags ()
                                {3,4,5,7,9,10,11,12}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {0,1,3}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x03BC,             // Range Minimum
                                0x03BC,             // Range Maximum
                                0x00,               // Alignment
                                0x04,               // Length
                                )
                            IO (Decode16,
                                0x07BC,             // Range Minimum
                                0x07BC,             // Range Maximum
                                0x00,               // Alignment
                                0x04,               // Length
                                )
                            IRQNoFlags ()
                                {3,4,5,7,9,10,11,12}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {0,1,3}
                        }
                        EndDependentFn ()
                    })
                    Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
                    {
                        CreateByteField (Arg0, 0x02, IOLO)
                        CreateByteField (Arg0, 0x03, IOHI)
                        CreateWordField (Arg0, 0x02, IOAD)
                        CreateWordField (Arg0, 0x11, IRQW)
                        CreateByteField (Arg0, 0x14, DMAC)
                        ENFG ()
                        LDN = 0x03
                        ACTR = One
                        IOAL = IOLO /* \_SB_.PCI0.PX40.ECP1._SRS.IOLO */
                        IOAH = IOHI /* \_SB_.PCI0.PX40.ECP1._SRS.IOHI */
                        FindSetLeftBit (IRQW, Local0)
                        Local0 -= 0x01
                        INTR = Local0
                        FindSetLeftBit (DMAC, Local1)
                        Local0 = DMCH /* \DMCH */
                        DMCH = (Local1 - 0x01)
                        SLDM (Local0, DMCH)
                        EXFG ()
                        CKIO (IOAD, 0x02)
                    }
                }

                OperationRegion (KBCT, SystemIO, 0x60, 0x05)
                Field (KBCT, ByteAcc, NoLock, Preserve)
                {
                    P060,   8, 
                    Offset (0x04), 
                    P064,   8
                }

                Device (PS2M)
                {
                    Name (_HID, EisaId ("PNP0F13") /* PS/2 Mouse */)  // _HID: Hardware ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If ((PS2F == 0x00))
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (0x00)
                        }
                    }

                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        Name (BUF1, ResourceTemplate ()
                        {
                            IRQNoFlags ()
                                {12}
                        })
                        Name (BUF2, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x0060,             // Range Minimum
                                0x0060,             // Range Maximum
                                0x01,               // Alignment
                                0x01,               // Length
                                )
                            IO (Decode16,
                                0x0064,             // Range Minimum
                                0x0064,             // Range Maximum
                                0x01,               // Alignment
                                0x01,               // Length
                                )
                            IRQNoFlags ()
                                {12}
                        })
                        If ((KBDI == 0x01))
                        {
                            If ((OSFL == 0x02))
                            {
                                Return (BUF1) /* \_SB_.PCI0.PX40.PS2M._CRS.BUF1 */
                            }

                            If ((OSFL == 0x01))
                            {
                                Return (BUF1) /* \_SB_.PCI0.PX40.PS2M._CRS.BUF1 */
                            }
                            Else
                            {
                                Return (BUF2) /* \_SB_.PCI0.PX40.PS2M._CRS.BUF2 */
                            }
                        }
                        Else
                        {
                            Return (BUF1) /* \_SB_.PCI0.PX40.PS2M._CRS.BUF1 */
                        }
                    }
                }

                Device (PS2K)
                {
                    Name (_HID, EisaId ("PNP0303") /* IBM Enhanced Keyboard (101/102-key, PS/2 Mouse) */)  // _HID: Hardware ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If ((KBDI == 0x01))
                        {
                            Return (0x00)
                        }
                        Else
                        {
                            Return (0x0F)
                        }
                    }

                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0060,             // Range Minimum
                            0x0060,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0064,             // Range Minimum
                            0x0064,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IRQNoFlags ()
                            {1}
                    })
                }

                Device (PSMR)
                {
                    Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
                    Name (_UID, 0x03)  // _UID: Unique ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If ((KBDI == 0x00))
                        {
                            Return (0x00)
                        }

                        If ((PS2F == 0x00))
                        {
                            If ((OSFL == 0x02))
                            {
                                Return (0x0F)
                            }

                            If ((OSFL == 0x01))
                            {
                                Return (0x0F)
                            }

                            Return (0x00)
                        }

                        Return (0x00)
                    }

                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0060,             // Range Minimum
                            0x0060,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0064,             // Range Minimum
                            0x0064,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                    })
                }

                Device (PMIO)
                {
                    Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
                    Name (_UID, 0x02)  // _UID: Unique ID
                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x0400,             // Range Minimum
                                0x0400,             // Range Maximum
                                0x01,               // Alignment
                                0xD0,               // Length
                                )
                        })
                        Return (BUF0) /* \_SB_.PCI0.PX40.PMIO._CRS.BUF0 */
                    }
                }
            }

            Device (USB0)
            {
                Name (_ADR, 0x001D0000)  // _ADR: Address
                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
                {
                    If ((OSFL == 0x02))
                    {
                        Return (0x02)
                    }

                    Return (0x03)
                }

                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
            }

            Device (USB1)
            {
                Name (_ADR, 0x001D0001)  // _ADR: Address
                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
                {
                    If ((OSFL == 0x02))
                    {
                        Return (0x02)
                    }

                    Return (0x03)
                }

                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x04, 
                    0x03
                })
            }

            Device (USB2)
            {
                Name (_ADR, 0x001D0002)  // _ADR: Address
                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
                {
                    If ((OSFL == 0x02))
                    {
                        Return (0x02)
                    }

                    Return (0x03)
                }

                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x0C, 
                    0x03
                })
            }

            Device (USB3)
            {
                Name (_ADR, 0x001D0003)  // _ADR: Address
                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
                {
                    If ((OSFL == 0x02))
                    {
                        Return (0x02)
                    }

                    Return (0x03)
                }

                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x0E, 
                    0x03
                })
            }

            Device (USBE)
            {
                Name (_ADR, 0x001D0007)  // _ADR: Address
                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
                {
                    If ((OSFL == 0x02))
                    {
                        Return (0x02)
                    }

                    Return (0x03)
                }

                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x0D, 
                    0x03
                })
            }

            Name (NATA, Package (0x01)
            {
                0x001F0001
            })
            Device (ICHX)
            {
                Name (_ADR, 0x001F0001)  // _ADR: Address
                OperationRegion (PCI, PCI_Config, 0x40, 0x20)
                Field (PCI, DWordAcc, NoLock, Preserve)
                {
                    ITM0,   16, 
                    ITM1,   16, 
                    SIT0,   4, 
                    SIT1,   4, 
                    Offset (0x08), 
                    UDC0,   2, 
                    UDC1,   2, 
                    Offset (0x0A), 
                    UDT0,   8, 
                    UDT1,   8, 
                    Offset (0x14), 
                    ICF0,   2, 
                    ICF1,   2, 
                        ,   6, 
                    WPPE,   1, 
                        ,   1, 
                    FAS0,   2, 
                    FAS1,   2
                }

                Method (GTM, 6, NotSerialized)
                {
                    Local0 = Buffer (0x14) {}
                    CreateDWordField (Local0, 0x00, PIO0)
                    CreateDWordField (Local0, 0x04, DMA0)
                    CreateDWordField (Local0, 0x08, PIO1)
                    CreateDWordField (Local0, 0x0C, DMA1)
                    CreateDWordField (Local0, 0x10, FLAG)
                    FLAG = 0x10
                    If (((Arg0 & 0x08) || !(Arg0 & 0x01)))
                    {
                        PIO0 = 0x0384
                    }
                    Else
                    {
                        Local1 = (((Arg0 & 0x0300) >> 0x08) + ((Arg0 & 
                            0x3000) >> 0x0C))
                        PIO0 = ((0x09 - Local1) * 0x1E)
                    }

                    If (((Arg0 && 0x4000) || (Arg2 && 0x01)))
                    {
                        If (((Arg0 & 0x80) || !(Arg0 & 0x10)))
                        {
                            PIO1 = 0x0384
                        }
                        Else
                        {
                            Local1 = ((Arg1 & 0x03) + ((Arg1 & 0x0C) >> 0x02
                                ))
                            PIO1 = ((0x09 - Local1) * 0x1E)
                        }
                    }
                    Else
                    {
                        PIO1 = PIO0 /* \_SB_.PCI0.ICHX.GTM_.PIO0 */
                    }

                    If ((Arg2 & 0x01))
                    {
                        Local1 = (0x04 - (Arg3 & 0x03))
                        If ((Arg5 & 0x01))
                        {
                            DMA0 = 0x14
                        }
                        ElseIf ((Arg4 & 0x01))
                        {
                            DMA0 = (Local1 * 0x0F)
                        }
                        Else
                        {
                            DMA0 = (Local1 * 0x1E)
                        }
                    }
                    Else
                    {
                        DMA0 = PIO0 /* \_SB_.PCI0.ICHX.GTM_.PIO0 */
                    }

                    If (((Arg0 && 0x4000) || (Arg2 && 0x01)))
                    {
                        If ((Arg2 & 0x02))
                        {
                            Local1 = (0x04 - ((Arg3 & 0x30) >> 0x04))
                            If ((Arg5 & 0x02))
                            {
                                DMA1 = 0x14
                            }
                            ElseIf ((Arg4 & 0x02))
                            {
                                DMA1 = (Local1 * 0x0F)
                            }
                            Else
                            {
                                DMA1 = (Local1 * 0x1E)
                            }
                        }
                        Else
                        {
                            DMA1 = PIO1 /* \_SB_.PCI0.ICHX.GTM_.PIO1 */
                        }
                    }
                    Else
                    {
                        DMA1 = DMA0 /* \_SB_.PCI0.ICHX.GTM_.DMA0 */
                    }

                    FLAG = Zero
                    If ((Arg0 & 0x01))
                    {
                        FLAG |= 0x10
                    }

                    If ((Arg2 & 0x01))
                    {
                        FLAG |= 0x01
                    }

                    If ((Arg0 & 0x02))
                    {
                        FLAG |= 0x02
                    }

                    If ((Arg2 & 0x02))
                    {
                        FLAG |= 0x04
                    }

                    If ((Arg0 & 0x20))
                    {
                        FLAG |= 0x08
                    }

                    Return (Local0)
                }

                Method (STM, 3, NotSerialized)
                {
                    Local7 = Buffer (0x18) {}
                    CreateDWordField (Local7, 0x00, ITM)
                    CreateDWordField (Local7, 0x04, SIT)
                    CreateDWordField (Local7, 0x08, UDC)
                    CreateDWordField (Local7, 0x0C, UDT)
                    CreateDWordField (Local7, 0x10, ICF)
                    CreateDWordField (Local7, 0x14, FAS)
                    CreateDWordField (Arg0, 0x00, PIO0)
                    CreateDWordField (Arg0, 0x04, DMA0)
                    CreateDWordField (Arg0, 0x08, PIO1)
                    CreateDWordField (Arg0, 0x0C, DMA1)
                    CreateDWordField (Arg0, 0x10, FLAG)
                    Local4 = FLAG /* \_SB_.PCI0.ICHX.STM_.FLAG */
                    Local0 = 0x8000
                    If ((Local4 & 0x02))
                    {
                        Local0 |= 0x07
                    }

                    If ((Local4 & 0x08))
                    {
                        Local0 |= 0x4000
                        Local0 |= 0x70
                    }

                    If (((DMA0 < PIO0) && !(Local4 & 0x01)))
                    {
                        Local0 |= 0x08
                    }

                    If (((DMA1 < PIO1) && !(Local4 & 0x04)))
                    {
                        Local0 |= 0x80
                    }

                    If (PIO0)
                    {
                        If ((PIO0 < 0x0384))
                        {
                            Local0 |= 0x01
                        }
                    }

                    If (PIO1)
                    {
                        If ((PIO1 < 0x0384))
                        {
                            Local0 |= 0x10
                        }
                    }

                    If ((Local4 & 0x01))
                    {
                        Local1 = PIO0 /* \_SB_.PCI0.ICHX.STM_.PIO0 */
                    }
                    Else
                    {
                        Local1 = DMA0 /* \_SB_.PCI0.ICHX.STM_.DMA0 */
                    }

                    If (Local1)
                    {
                        If ((Local1 <= 0x78))
                        {
                            Local0 |= 0x2300
                        }
                        ElseIf ((Local1 <= 0xB4))
                        {
                            Local0 |= 0x2100
                        }
                        ElseIf ((Local1 <= 0xF0))
                        {
                            Local0 |= 0x1000
                        }
                    }

                    ITM = Local0
                    Local0 = Zero
                    If ((Local4 & 0x04))
                    {
                        Local1 = PIO1 /* \_SB_.PCI0.ICHX.STM_.PIO1 */
                    }
                    Else
                    {
                        Local1 = DMA1 /* \_SB_.PCI0.ICHX.STM_.DMA1 */
                    }

                    If (Local1)
                    {
                        If ((Local1 <= 0x78))
                        {
                            Local0 = 0x0B
                        }
                        ElseIf ((Local1 <= 0xB4))
                        {
                            Local0 = 0x09
                        }
                        ElseIf ((Local1 <= 0xF0))
                        {
                            Local0 = 0x04
                        }
                    }

                    SIT = Local0
                    Local0 = 0x00
                    If ((Local4 & 0x01))
                    {
                        Local0 |= 0x01
                    }

                    If ((Local4 & 0x04))
                    {
                        Local0 |= 0x02
                    }

                    UDC = Local0
                    Local0 = 0x00
                    If ((Local4 & 0x01))
                    {
                        If ((DMA0 == 0x14))
                        {
                            Local0 = 0x01
                        }
                        Else
                        {
                            If ((DMA0 < 0x3C))
                            {
                                Local1 = (DMA0 / 0x0F)
                            }
                            Else
                            {
                                Local1 = (DMA0 / 0x1E)
                            }

                            Local0 = (0x04 - Local1)
                        }
                    }

                    If ((Local4 & 0x04))
                    {
                        If ((DMA1 == 0x14))
                        {
                            Local1 = 0x01
                        }
                        Else
                        {
                            If ((DMA1 < 0x3C))
                            {
                                Local1 = (DMA1 / 0x0F)
                            }
                            Else
                            {
                                Local1 = (DMA1 / 0x1E)
                            }

                            Local1 = (0x04 - Local1)
                        }

                        Local1 <<= 0x04
                        Local0 |= Local1
                    }

                    UDT = Local0
                    Local0 = 0x00
                    If (DMA0)
                    {
                        If ((DMA0 > 0x14))
                        {
                            If ((DMA0 < 0x3C))
                            {
                                Local0 |= 0x01
                            }
                        }
                    }

                    If (DMA1)
                    {
                        If ((DMA1 > 0x14))
                        {
                            If ((DMA1 < 0x3C))
                            {
                                Local0 |= 0x02
                            }
                        }
                    }

                    ICF = Local0
                    Local0 = 0x00
                    If ((DMA0 == 0x14))
                    {
                        Local0 |= 0x01
                    }

                    If ((DMA1 == 0x14))
                    {
                        Local0 |= 0x02
                    }

                    FAS = Local0
                    Return (Local7)
                }

                Method (H15P, 1, NotSerialized)
                {
                    Name (BUFF, Buffer (0x08)
                    {
                         0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                    })
                    Local0 = Arg0
                    Local1 = BUFF /* \_SB_.PCI0.ICHX.H15P.BUFF */
                    Concatenate (Local0, Local1, Local7)
                    CreateWordField (Local7, 0x02, CYL)
                    CreateWordField (Local7, 0x06, HEAD)
                    CreateWordField (Local7, 0x0C, SPT)
                    If (((HEAD >= 0x10) && (CYL >= 0x2000)))
                    {
                        Return (SPT) /* \_SB_.PCI0.ICHX.H15P.SPT_ */
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }

                Method (GTF0, 7, NotSerialized)
                {
                    Local7 = Buffer (0x07)
                        {
                             0x03, 0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF         // .......
                        }
                    CreateByteField (Local7, 0x01, MODE)
                    If ((Arg2 & 0x01))
                    {
                        Local0 = (Arg3 & 0x03)
                        If ((Arg6 & 0x01))
                        {
                            Local0 += 0x04
                        }
                        ElseIf ((Arg4 & 0x01))
                        {
                            Local0 += 0x02
                        }

                        MODE = (Local0 | 0x40)
                    }
                    Else
                    {
                        Local0 = (((Arg0 & 0x0300) >> 0x08) + ((Arg0 & 
                            0x3000) >> 0x0C))
                        If ((Local0 >= 0x05))
                        {
                            MODE = 0x22
                        }
                        ElseIf ((Local0 >= 0x03))
                        {
                            MODE = 0x21
                        }
                        Else
                        {
                            MODE = 0x20
                        }
                    }

                    Concatenate (Local7, Local7, Local6)
                    If (((Arg0 & 0x08) || !(Arg0 & 0x01)))
                    {
                        If ((Arg0 & 0x02))
                        {
                            MODE = 0x00
                        }
                        Else
                        {
                            MODE = 0x01
                        }
                    }
                    Else
                    {
                        Local0 = (((Arg0 & 0x0300) >> 0x08) + ((Arg0 & 
                            0x3000) >> 0x0C))
                        If ((Local0 >= 0x05))
                        {
                            MODE = 0x0C
                        }
                        ElseIf ((Local0 >= 0x03))
                        {
                            MODE = 0x0B
                        }
                        Else
                        {
                            MODE = 0x0A
                        }
                    }

                    Concatenate (Local6, Local7, Local5)
                    If (Arg5)
                    {
                        Local4 = Buffer (0x07)
                            {
                                 0x00, 0x00, 0x00, 0x00, 0x00, 0xAE, 0x91         // .......
                            }
                        CreateByteField (Local4, 0x01, SPT)
                        SPT = Arg5
                        Concatenate (Local5, Local4, Local6)
                        Return (Local6)
                    }
                    Else
                    {
                        Return (Local5)
                    }
                }

                Method (GTF1, 7, NotSerialized)
                {
                    Local7 = Buffer (0x07)
                        {
                             0x03, 0x00, 0x00, 0x00, 0x00, 0xB0, 0xEF         // .......
                        }
                    CreateByteField (Local7, 0x01, MODE)
                    If ((Arg2 & 0x02))
                    {
                        Local0 = ((Arg3 & 0x30) >> 0x04)
                        If ((Arg6 & 0x02))
                        {
                            Local0 += 0x04
                        }
                        ElseIf ((Arg4 & 0x02))
                        {
                            Local0 += 0x02
                        }

                        MODE = (Local0 | 0x40)
                    }
                    Else
                    {
                        Local0 = (((Arg1 & 0x03) >> 0x02) + (Arg1 & 0x0C
                            ))
                        If ((Local0 >= 0x05))
                        {
                            MODE = 0x22
                        }
                        ElseIf ((Local0 >= 0x03))
                        {
                            MODE = 0x21
                        }
                        Else
                        {
                            MODE = 0x20
                        }
                    }

                    Concatenate (Local7, Local7, Local6)
                    If (((Arg0 & 0x80) || !(Arg0 & 0x10)))
                    {
                        If ((Arg0 & 0x20))
                        {
                            MODE = 0x00
                        }
                        Else
                        {
                            MODE = 0x01
                        }
                    }
                    Else
                    {
                        Local0 = (((Arg1 & 0x03) >> 0x02) + (Arg1 & 0x0C
                            ))
                        If ((Local0 >= 0x05))
                        {
                            MODE = 0x0C
                        }
                        ElseIf ((Local0 >= 0x03))
                        {
                            MODE = 0x0B
                        }
                        Else
                        {
                            MODE = 0x0A
                        }
                    }

                    Concatenate (Local6, Local7, Local5)
                    If (Arg5)
                    {
                        Local4 = Buffer (0x07)
                            {
                                 0x00, 0x00, 0x00, 0x00, 0x00, 0xBE, 0x91         // .......
                            }
                        CreateByteField (Local4, 0x01, SPT)
                        SPT = Arg5
                        Concatenate (Local5, Local4, Local6)
                        Return (Local6)
                    }
                    Else
                    {
                        Return (Local5)
                    }
                }

                Device (PRIM)
                {
                    Name (_ADR, 0x00)  // _ADR: Address
                    Method (_GTM, 0, NotSerialized)  // _GTM: Get Timing Mode
                    {
                        Local0 = GTM (ITM0, SIT0, UDC0, UDT0, ICF0, FAS0)
                        Return (Local0)
                    }

                    Method (_STM, 3, NotSerialized)  // _STM: Set Timing Mode
                    {
                        Local0 = STM (Arg0, Arg1, Arg2)
                        CreateDWordField (Local0, 0x00, ITM)
                        CreateDWordField (Local0, 0x04, SIT)
                        CreateDWordField (Local0, 0x08, UDC)
                        CreateDWordField (Local0, 0x0C, UDT)
                        CreateDWordField (Local0, 0x10, ICF)
                        CreateDWordField (Local0, 0x14, FAS)
                        UDC0 = UDC /* \_SB_.PCI0.ICHX.PRIM._STM.UDC_ */
                        UDT0 = UDT /* \_SB_.PCI0.ICHX.PRIM._STM.UDT_ */
                        ICF0 = ICF /* \_SB_.PCI0.ICHX.PRIM._STM.ICF_ */
                        FAS0 = FAS /* \_SB_.PCI0.ICHX.PRIM._STM.FAS_ */
                    }

                    Device (MAST)
                    {
                        Name (_ADR, 0x00)  // _ADR: Address
                        Name (H15F, Zero)
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Local0 = GTF0 (ITM0, SIT0, UDC0, UDT0, ICF0, H15F, FAS0)
                            Return (Local0)
                        }
                    }

                    Device (SLAV)
                    {
                        Name (_ADR, 0x01)  // _ADR: Address
                        Name (H15F, Zero)
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Local0 = GTF1 (ITM0, SIT0, UDC0, UDT0, ICF0, H15F, FAS0)
                            Return (Local0)
                        }
                    }
                }

                Device (SECN)
                {
                    Name (_ADR, 0x01)  // _ADR: Address
                    Method (_GTM, 0, NotSerialized)  // _GTM: Get Timing Mode
                    {
                        Local0 = GTM (ITM1, SIT1, UDC1, UDT1, ICF1, FAS1)
                        Return (Local0)
                    }

                    Method (_STM, 3, NotSerialized)  // _STM: Set Timing Mode
                    {
                        Local0 = STM (Arg0, Arg1, Arg2)
                        CreateDWordField (Local0, 0x00, ITM)
                        CreateDWordField (Local0, 0x04, SIT)
                        CreateDWordField (Local0, 0x08, UDC)
                        CreateDWordField (Local0, 0x0C, UDT)
                        CreateDWordField (Local0, 0x10, ICF)
                        CreateDWordField (Local0, 0x14, FAS)
                        UDC1 = UDC /* \_SB_.PCI0.ICHX.SECN._STM.UDC_ */
                        UDT1 = UDT /* \_SB_.PCI0.ICHX.SECN._STM.UDT_ */
                        ICF1 = ICF /* \_SB_.PCI0.ICHX.SECN._STM.ICF_ */
                        FAS1 = FAS /* \_SB_.PCI0.ICHX.SECN._STM.FAS_ */
                    }

                    Device (MAST)
                    {
                        Name (_ADR, 0x00)  // _ADR: Address
                        Name (H15F, Zero)
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Local0 = GTF0 (ITM1, SIT1, UDC1, UDT1, ICF1, H15F, FAS1)
                            Return (Local0)
                        }
                    }

                    Device (SLAV)
                    {
                        Name (_ADR, 0x01)  // _ADR: Address
                        Name (H15F, Zero)
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Local0 = GTF1 (ITM1, SIT1, UDC1, UDT1, ICF1, H15F, FAS1)
                            Return (Local0)
                        }
                    }
                }
            }

            Device (IDE1)
            {
                Name (_ADR, 0x001F0002)  // _ADR: Address
                OperationRegion (PCI, PCI_Config, 0x40, 0x20)
                Field (PCI, DWordAcc, NoLock, Preserve)
                {
                    ITM0,   16, 
                    ITM1,   16, 
                    SIT0,   4, 
                    SIT1,   4, 
                    Offset (0x08), 
                    UDC0,   2, 
                    UDC1,   2, 
                    Offset (0x0A), 
                    UDT0,   8, 
                    UDT1,   8, 
                    Offset (0x14), 
                    ICF0,   2, 
                    ICF1,   2, 
                        ,   6, 
                    WPPE,   1, 
                        ,   1, 
                    FAS0,   2, 
                    FAS1,   2
                }

                Device (PRIM)
                {
                    Name (_ADR, 0x00)  // _ADR: Address
                    Method (_GTM, 0, NotSerialized)  // _GTM: Get Timing Mode
                    {
                        Local0 = \_SB.PCI0.ICHX.GTM (ITM0, SIT0, UDC0, UDT0, ICF0, FAS0)
                        Return (Local0)
                    }

                    Method (_STM, 3, NotSerialized)  // _STM: Set Timing Mode
                    {
                        Local0 = \_SB.PCI0.ICHX.STM (Arg0, Arg1, Arg2)
                        CreateDWordField (Local0, 0x00, ITM)
                        CreateDWordField (Local0, 0x04, SIT)
                        CreateDWordField (Local0, 0x08, UDC)
                        CreateDWordField (Local0, 0x0C, UDT)
                        CreateDWordField (Local0, 0x10, ICF)
                        CreateDWordField (Local0, 0x14, FAS)
                        UDC0 = UDC /* \_SB_.PCI0.IDE1.PRIM._STM.UDC_ */
                        UDT0 = UDT /* \_SB_.PCI0.IDE1.PRIM._STM.UDT_ */
                        ICF0 = ICF /* \_SB_.PCI0.IDE1.PRIM._STM.ICF_ */
                        FAS0 = FAS /* \_SB_.PCI0.IDE1.PRIM._STM.FAS_ */
                    }

                    Device (DRV0)
                    {
                        Name (_ADR, 0x00)  // _ADR: Address
                        Name (H15F, Zero)
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Local0 = \_SB.PCI0.ICHX.GTF0 (ITM0, SIT0, UDC0, UDT0, ICF0, H15F, FAS0)
                            Return (Local0)
                        }
                    }

                    Device (DRV1)
                    {
                        Name (_ADR, 0x01)  // _ADR: Address
                        Name (H15F, Zero)
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Local0 = \_SB.PCI0.ICHX.GTF1 (ITM0, SIT0, UDC0, UDT0, ICF0, H15F, FAS0)
                            Return (Local0)
                        }
                    }
                }

                Device (SECD)
                {
                    Name (_ADR, 0x01)  // _ADR: Address
                    Method (_GTM, 0, NotSerialized)  // _GTM: Get Timing Mode
                    {
                        Local0 = \_SB.PCI0.ICHX.GTM (ITM1, SIT1, UDC1, UDT1, ICF1, FAS1)
                        Return (Local0)
                    }

                    Method (_STM, 3, NotSerialized)  // _STM: Set Timing Mode
                    {
                        Local0 = \_SB.PCI0.ICHX.STM (Arg0, Arg1, Arg2)
                        CreateDWordField (Local0, 0x00, ITM)
                        CreateDWordField (Local0, 0x04, SIT)
                        CreateDWordField (Local0, 0x08, UDC)
                        CreateDWordField (Local0, 0x0C, UDT)
                        CreateDWordField (Local0, 0x10, ICF)
                        CreateDWordField (Local0, 0x14, FAS)
                        UDC1 = UDC /* \_SB_.PCI0.IDE1.SECD._STM.UDC_ */
                        UDT1 = UDT /* \_SB_.PCI0.IDE1.SECD._STM.UDT_ */
                        ICF1 = ICF /* \_SB_.PCI0.IDE1.SECD._STM.ICF_ */
                        FAS1 = FAS /* \_SB_.PCI0.IDE1.SECD._STM.FAS_ */
                    }

                    Device (DRV0)
                    {
                        Name (_ADR, 0x00)  // _ADR: Address
                        Name (H15F, Zero)
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Local0 = \_SB.PCI0.ICHX.GTF0 (ITM1, SIT1, UDC1, UDT1, ICF1, H15F, FAS1)
                            Return (Local0)
                        }
                    }

                    Device (DRV1)
                    {
                        Name (_ADR, 0x01)  // _ADR: Address
                        Name (H15F, Zero)
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Local0 = \_SB.PCI0.ICHX.GTF1 (ITM1, SIT1, UDC1, UDT1, ICF1, H15F, FAS1)
                            Return (Local0)
                        }
                    }
                }
            }

            Device (PX43)
            {
                Name (_ADR, 0x001F0003)  // _ADR: Address
                OperationRegion (PBAS, PCI_Config, 0x20, 0x02)
                Field (PBAS, ByteAcc, NoLock, Preserve)
                {
                    BAS0,   16
                }

                Method (SMBB, 0, NotSerialized)
                {
                    Local0 = (BAS0 & 0xFFFE)
                    Return (Local0)
                }
            }

            Device (AZAL)
            {
                Name (_ADR, 0x001B0000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (Package (0x02)
                    {
                        0x05, 
                        0x05
                    })
                }
            }

            Name (BUFA, ResourceTemplate ()
            {
                IRQ (Level, ActiveLow, Shared, )
                    {3,4,5,6,7,9,10,11,12,14,15}
            })
            Name (BUFB, ResourceTemplate ()
            {
                IRQ (Level, ActiveLow, Shared, _Y0A)
                    {}
            })
            CreateWordField (BUFB, \_SB.PCI0._Y0A._INT, IRQV)  // _INT: Interrupts
            Device (LNKA)
            {
                Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
                Name (_UID, 0x01)  // _UID: Unique ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Local0 = (PIRA & 0x80)
                    If ((Local0 == 0x80))
                    {
                        Return (0x09)
                    }
                    Else
                    {
                        Return (0x0B)
                    }
                }

                Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
                {
                    Return (BUFA) /* \_SB_.PCI0.BUFA */
                }

                Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                {
                    PIRA |= 0x80
                }

                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Local0 = (PIRA & 0x0F)
                    IRQV = (0x01 << Local0)
                    Return (BUFB) /* \_SB_.PCI0.BUFB */
                }

                Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
                {
                    CreateWordField (Arg0, 0x01, IRQ1)
                    FindSetRightBit (IRQ1, Local0)
                    Local0--
                    PIRA = Local0
                }
            }

            Device (LNKB)
            {
                Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
                Name (_UID, 0x02)  // _UID: Unique ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Local0 = (PIRB & 0x80)
                    If ((Local0 == 0x80))
                    {
                        Return (0x09)
                    }
                    Else
                    {
                        Return (0x0B)
                    }
                }

                Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
                {
                    Return (BUFA) /* \_SB_.PCI0.BUFA */
                }

                Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                {
                    PIRB |= 0x80
                }

                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Local0 = (PIRB & 0x0F)
                    IRQV = (0x01 << Local0)
                    Return (BUFB) /* \_SB_.PCI0.BUFB */
                }

                Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
                {
                    CreateWordField (Arg0, 0x01, IRQ1)
                    FindSetRightBit (IRQ1, Local0)
                    Local0--
                    PIRB = Local0
                }
            }

            Device (LNKC)
            {
                Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
                Name (_UID, 0x03)  // _UID: Unique ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Local0 = (PIRC & 0x80)
                    If ((Local0 == 0x80))
                    {
                        Return (0x09)
                    }
                    Else
                    {
                        Return (0x0B)
                    }
                }

                Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
                {
                    Return (BUFA) /* \_SB_.PCI0.BUFA */
                }

                Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                {
                    PIRC |= 0x80
                }

                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Local0 = (PIRC & 0x0F)
                    IRQV = (0x01 << Local0)
                    Return (BUFB) /* \_SB_.PCI0.BUFB */
                }

                Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
                {
                    CreateWordField (Arg0, 0x01, IRQ1)
                    FindSetRightBit (IRQ1, Local0)
                    Local0--
                    PIRC = Local0
                }
            }

            Device (LNKD)
            {
                Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
                Name (_UID, 0x04)  // _UID: Unique ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Local0 = (PIRD & 0x80)
                    If ((Local0 == 0x80))
                    {
                        Return (0x09)
                    }
                    Else
                    {
                        Return (0x0B)
                    }
                }

                Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
                {
                    Return (BUFA) /* \_SB_.PCI0.BUFA */
                }

                Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                {
                    PIRD |= 0x80
                }

                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Local0 = (PIRD & 0x0F)
                    IRQV = (0x01 << Local0)
                    Return (BUFB) /* \_SB_.PCI0.BUFB */
                }

                Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
                {
                    CreateWordField (Arg0, 0x01, IRQ1)
                    FindSetRightBit (IRQ1, Local0)
                    Local0--
                    PIRD = Local0
                }
            }

            Device (LNKE)
            {
                Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
                Name (_UID, 0x05)  // _UID: Unique ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Local0 = (PIRE & 0x80)
                    If ((Local0 == 0x80))
                    {
                        Return (0x09)
                    }
                    Else
                    {
                        Return (0x0B)
                    }
                }

                Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
                {
                    Return (BUFA) /* \_SB_.PCI0.BUFA */
                }

                Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                {
                    PIRE |= 0x80
                }

                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Local0 = (PIRE & 0x0F)
                    IRQV = (0x01 << Local0)
                    Return (BUFB) /* \_SB_.PCI0.BUFB */
                }

                Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
                {
                    CreateWordField (Arg0, 0x01, IRQ1)
                    FindSetRightBit (IRQ1, Local0)
                    Local0--
                    PIRE = Local0
                }
            }

            Device (LNKF)
            {
                Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
                Name (_UID, 0x06)  // _UID: Unique ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Local0 = (PIRF & 0x80)
                    If ((Local0 == 0x80))
                    {
                        Return (0x09)
                    }
                    Else
                    {
                        Return (0x0B)
                    }
                }

                Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
                {
                    Return (BUFA) /* \_SB_.PCI0.BUFA */
                }

                Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                {
                    PIRF |= 0x80
                }

                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Local0 = (PIRF & 0x0F)
                    IRQV = (0x01 << Local0)
                    Return (BUFB) /* \_SB_.PCI0.BUFB */
                }

                Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
                {
                    CreateWordField (Arg0, 0x01, IRQ1)
                    FindSetRightBit (IRQ1, Local0)
                    Local0--
                    PIRF = Local0
                }
            }

            Device (LNK0)
            {
                Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
                Name (_UID, 0x07)  // _UID: Unique ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Local0 = (PIRG & 0x80)
                    If ((Local0 == 0x80))
                    {
                        Return (0x09)
                    }
                    Else
                    {
                        Return (0x0B)
                    }
                }

                Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
                {
                    Return (BUFA) /* \_SB_.PCI0.BUFA */
                }

                Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                {
                    PIRG |= 0x80
                }

                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Local0 = (PIRG & 0x0F)
                    IRQV = (0x01 << Local0)
                    Return (BUFB) /* \_SB_.PCI0.BUFB */
                }

                Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
                {
                    CreateWordField (Arg0, 0x01, IRQ1)
                    FindSetRightBit (IRQ1, Local0)
                    Local0--
                    PIRG = Local0
                }
            }

            Device (LNK1)
            {
                Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
                Name (_UID, 0x08)  // _UID: Unique ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Local0 = (PIRH & 0x80)
                    If ((Local0 == 0x80))
                    {
                        Return (0x09)
                    }
                    Else
                    {
                        Return (0x0B)
                    }
                }

                Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
                {
                    Return (BUFA) /* \_SB_.PCI0.BUFA */
                }

                Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                {
                    PIRH |= 0x80
                }

                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Local0 = (PIRH & 0x0F)
                    IRQV = (0x01 << Local0)
                    Return (BUFB) /* \_SB_.PCI0.BUFB */
                }

                Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
                {
                    CreateWordField (Arg0, 0x01, IRQ1)
                    FindSetRightBit (IRQ1, Local0)
                    Local0--
                    PIRH = Local0
                }
            }

            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
            {
                Return (Package (0x02)
                {
                    0x0B, 
                    0x05
                })
            }
        }

        Device (MEM)
        {
            Name (_HID, EisaId ("PNP0C01") /* System Board */)  // _HID: Hardware ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (BUF0, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0x000F0000,         // Address Base
                        0x00004000,         // Address Length
                        _Y0C)
                    Memory32Fixed (ReadWrite,
                        0x000F4000,         // Address Base
                        0x00004000,         // Address Length
                        _Y0D)
                    Memory32Fixed (ReadWrite,
                        0x000F8000,         // Address Base
                        0x00004000,         // Address Length
                        _Y0E)
                    Memory32Fixed (ReadWrite,
                        0x000FC000,         // Address Base
                        0x00004000,         // Address Length
                        _Y0F)
                    Memory32Fixed (ReadWrite,
                        0x00000000,         // Address Base
                        0x00010000,         // Address Length
                        _Y0B)
                    Memory32Fixed (ReadWrite,
                        0x00000000,         // Address Base
                        0x000A0000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0x00100000,         // Address Base
                        0x00000000,         // Address Length
                        _Y11)
                    Memory32Fixed (ReadWrite,
                        0x00000000,         // Address Base
                        0x00000000,         // Address Length
                        _Y12)
                    Memory32Fixed (ReadWrite,
                        0xFEC00000,         // Address Base
                        0x00001000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFED13000,         // Address Base
                        0x0000B000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFED20000,         // Address Base
                        0x00070000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFEE00000,         // Address Base
                        0x00001000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFFB00000,         // Address Base
                        0x00080000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFFF00000,         // Address Base
                        0x00100000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0x000E0000,         // Address Base
                        0x00010000,         // Address Length
                        _Y10)
                })
                CreateDWordField (BUF0, \_SB.MEM._CRS._Y0B._BAS, ACMM)  // _BAS: Base Address
                CreateDWordField (BUF0, \_SB.MEM._CRS._Y0C._BAS, RMA1)  // _BAS: Base Address
                CreateDWordField (BUF0, \_SB.MEM._CRS._Y0C._LEN, RSS1)  // _LEN: Length
                CreateDWordField (BUF0, \_SB.MEM._CRS._Y0D._BAS, RMA2)  // _BAS: Base Address
                CreateDWordField (BUF0, \_SB.MEM._CRS._Y0D._LEN, RSS2)  // _LEN: Length
                CreateDWordField (BUF0, \_SB.MEM._CRS._Y0E._BAS, RMA3)  // _BAS: Base Address
                CreateDWordField (BUF0, \_SB.MEM._CRS._Y0E._LEN, RSS3)  // _LEN: Length
                CreateDWordField (BUF0, \_SB.MEM._CRS._Y0F._BAS, RMA4)  // _BAS: Base Address
                CreateDWordField (BUF0, \_SB.MEM._CRS._Y0F._LEN, RSS4)  // _LEN: Length
                CreateDWordField (BUF0, \_SB.MEM._CRS._Y10._BAS, ERMA)  // _BAS: Base Address
                CreateDWordField (BUF0, \_SB.MEM._CRS._Y10._LEN, ERMS)  // _LEN: Length
                CreateDWordField (BUF0, \_SB.MEM._CRS._Y11._LEN, EXTM)  // _LEN: Length
                CreateDWordField (BUF0, \_SB.MEM._CRS._Y12._BAS, USMA)  // _BAS: Base Address
                CreateDWordField (BUF0, \_SB.MEM._CRS._Y12._LEN, USMS)  // _LEN: Length
                USMA = (AMEM + 0x00010000)
                USMS += 0x00010000
                EXTM = (AMEM - 0x00100000)
                If ((ROM1 != Zero))
                {
                    RMA2 = RMA1 /* \_SB_.MEM_._CRS.RMA1 */
                    Local0 = (ROM1 << 0x08)
                    RMA1 = Local0
                    Local0 = (RMS1 << 0x08)
                    RSS1 = Local0
                    RSS2 = 0x8000
                }

                If ((ROM2 != Zero))
                {
                    RMA3 = RMA2 /* \_SB_.MEM_._CRS.RMA2 */
                    Local0 = (ROM2 << 0x08)
                    RMA2 = Local0
                    Local0 = (RMS2 << 0x08)
                    RSS2 = Local0
                    RSS3 = 0xC000
                }

                If ((ROM3 != Zero))
                {
                    RMA4 = RMA3 /* \_SB_.MEM_._CRS.RMA3 */
                    Local0 = (ROM3 << 0x08)
                    RMA3 = Local0
                    Local0 = (RMS3 << 0x08)
                    RSS3 = Local0
                    RSS4 = 0x00010000
                }

                Local1 = ERMA /* \_SB_.MEM_._CRS.ERMA */
                If ((RMA1 > 0x000D0000))
                {
                    If ((RMA1 < 0x000F0000))
                    {
                        Local0 = (RMA1 + RSS1) /* \_SB_.MEM_._CRS.RSS1 */
                        If ((Local0 > 0x000E0000))
                        {
                            If ((Local0 > Local1))
                            {
                                Local1 = Local0
                            }
                        }
                    }
                }

                If ((RMA2 > 0x000D0000))
                {
                    If ((RMA2 < 0x000F0000))
                    {
                        Local0 = (RMA2 + RSS2) /* \_SB_.MEM_._CRS.RSS2 */
                        If ((Local0 > 0x000E0000))
                        {
                            If ((Local0 > Local1))
                            {
                                Local1 = Local0
                            }
                        }
                    }
                }

                If ((RMA3 > 0x000D0000))
                {
                    If ((RMA3 < 0x000F0000))
                    {
                        Local0 = (RMA3 + RSS3) /* \_SB_.MEM_._CRS.RSS3 */
                        If ((Local0 > 0x000E0000))
                        {
                            If ((Local0 > Local1))
                            {
                                Local1 = Local0
                            }
                        }
                    }
                }

                If ((Local1 > ERMA))
                {
                    Local0 = (Local1 - ERMA) /* \_SB_.MEM_._CRS.ERMA */
                    If ((Local0 <= 0x00010000))
                    {
                        ERMA = Local1
                        ERMS = (0x00010000 - Local0)
                    }
                }

                ACMM = AMEM /* \AMEM */
                Return (BUF0) /* \_SB_.MEM_._CRS.BUF0 */
            }
        }

        Device (FWH)
        {
            Name (_HID, EisaId ("INT0800") /* Intel 82802 Firmware Hub Device */)  // _HID: Hardware ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (FWH0, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0xFFB80000,         // Address Base
                        0x00080000,         // Address Length
                        )
                })
                Return (FWH0) /* \_SB_.FWH_._CRS.FWH0 */
            }
        }

        Device (\_SB.PCI0.EXPL)
        {
            Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
            Name (_UID, 0x04)  // _UID: Unique ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (BUF0, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0xF4000000,         // Address Base
                        0x04000000,         // Address Length
                        )
                })
                Return (BUF0) /* \_SB_.PCI0.EXPL._CRS.BUF0 */
            }
        }
    }
}

