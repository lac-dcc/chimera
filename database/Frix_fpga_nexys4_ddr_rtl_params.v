/*
 * Copyright (c) 2015, Arch Laboratory
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 *    this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
 * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 */

///////////////////////////////
// USER-DEFINED PARAMETERS   //
///////////////////////////////

// CLOCK PARAMETERS

`define FREQUENCY 50 // MHz

// HDD PARAMETERS

`define HDD_CYLINDERS     1024
`define HDD_HEADS         16
`define HDD_SPT           63
`define HDD_SD_BASE       102400

// MEMORY PARAMETERS

`define MEMORY_SIZE        128 // MB

///////////////////////////////
// SYSTEM-DEFINED PARAMETERS //
///////////////////////////////

`define PIT_CYCLES_IN_1193181HZ           ((`FREQUENCY * 1000 * 1000) / 1193181)

`define RTC_CYCLES_IN_SECOND              (`FREQUENCY * 1000 * 1000)
`define RTC_CYCLES_IN_122US               ((`FREQUENCY * 12207031) / 10000) // cycles in 122.07031 us

`define HDD_SPH           (`HDD_HEADS * `HDD_SPT)
`define HDD_TOTAL_SECTORS (`HDD_CYLINDERS * `HDD_HEADS * `HDD_SPT)

`define HDD_GENERAL_CONFIGRATION          16'h0040                                                              // 0
`define HDD_DEFAULT_NUMBER_OF_CYLINDERS   ((`HDD_CYLINDERS > 16383) ? 16383 : `HDD_CYLINDERS)                   // 1
`define HDD_RESERVED0                     16'h00                                                                // 2
`define HDD_DEFAULT_NUMBER_OF_HEADS       `HDD_HEADS                                                            // 3
`define HDD_SECTOR_CAPACITY               (`HDD_SPT * 512)                                                      // 4
`define HDD_TRACK_CAPACITY                16'd512                                                               // 5
`define HDD_DEFAULT_NUMBER_OF_SPT         `HDD_SPT                                                              // 6
`define HDD_MIN_SIZE_OF_ISG               16'h0000                                                              // 7
`define HDD_RESERVED1                     16'h0000                                                              // 8
`define HDD_MIN_PLO_BYTES                 16'h0000                                                              // 9
`define HDD_SERIAL_NUMBER0                {8'h41, 8'h4f}                                                        // 'A', 'O' // 10
`define HDD_SERIAL_NUMBER1                {8'h48, 8'h44}                                                        // 'H', 'D' // 11
`define HDD_SERIAL_NUMBER2                {8'h30, 8'h30}                                                        // '0', '0' // 12
`define HDD_SERIAL_NUMBER3                {8'h30, 8'h30}                                                        // '0', '0' // 13
`define HDD_SERIAL_NUMBER4                {8'h30, 8'h20}                                                        // '0', ' ' // 14
`define HDD_SERIAL_NUMBER5                {8'h20, 8'h20}                                                        // ' ', ' ' // 15
`define HDD_SERIAL_NUMBER6                {8'h20, 8'h20}                                                        // ' ', ' ' // 16
`define HDD_SERIAL_NUMBER7                {8'h20, 8'h20}                                                        // ' ', ' ' // 17
`define HDD_SERIAL_NUMBER8                {8'h20, 8'h20}                                                        // ' ', ' ' // 18
`define HDD_SERIAL_NUMBER9                {8'h20, 8'h20}                                                        // ' ', ' ' // 19
`define HDD_BUFFER_TYPE                   16'd3                                                                 // 20
`define HDD_CACHE_SIZE                    16'd512                                                               // 21
`define HDD_ECC_BYTES                     16'd4                                                                 // 22
`define HDD_FIRMWARE_REVISION0            16'd0                                                                 // 23
`define HDD_FIRMWARE_REVISION1            16'd0                                                                 // 24
`define HDD_FIRMWARE_REVISION2            16'd0                                                                 // 25
`define HDD_FIRMWARE_REVISION3            16'd0                                                                 // 26
`define HDD_MODEL_NUMBER0                 {8'h41, 8'h4f}                                                        // 'A', 'O' // 27
`define HDD_MODEL_NUMBER1                 {8'h20, 8'h48}                                                        // ' ', 'H' // 28
`define HDD_MODEL_NUMBER2                 {8'h61, 8'h72}                                                        // 'a', 'r' // 29
`define HDD_MODEL_NUMBER3                 {8'h64, 8'h64}                                                        // 'd', 'd' // 30
`define HDD_MODEL_NUMBER4                 {8'h72, 8'h69}                                                        // 'r', 'i' // 31
`define HDD_MODEL_NUMBER5                 {8'h76, 8'h65}                                                        // 'v', 'e' // 32
`define HDD_MODEL_NUMBER6                 {8'h20, 8'h20}                                                        // ' ', ' ' // 33
`define HDD_MODEL_NUMBER7                 {8'h20, 8'h20}                                                        // ' ', ' ' // 34
`define HDD_MODEL_NUMBER8                 {8'h20, 8'h20}                                                        // ' ', ' ' // 35
`define HDD_MODEL_NUMBER9                 {8'h20, 8'h20}                                                        // ' ', ' ' // 36
`define HDD_MODEL_NUMBER10                {8'h20, 8'h20}                                                        // ' ', ' ' // 37
`define HDD_MODEL_NUMBER11                {8'h20, 8'h20}                                                        // ' ', ' ' // 38
`define HDD_MODEL_NUMBER12                {8'h20, 8'h20}                                                        // ' ', ' ' // 39
`define HDD_MODEL_NUMBER13                {8'h20, 8'h20}                                                        // ' ', ' ' // 40
`define HDD_MODEL_NUMBER14                {8'h20, 8'h20}                                                        // ' ', ' ' // 41
`define HDD_MODEL_NUMBER15                {8'h20, 8'h20}                                                        // ' ', ' ' // 42
`define HDD_MODEL_NUMBER16                {8'h20, 8'h20}                                                        // ' ', ' ' // 43
`define HDD_MODEL_NUMBER17                {8'h20, 8'h20}                                                        // ' ', ' ' // 44
`define HDD_MODEL_NUMBER18                {8'h20, 8'h20}                                                        // ' ', ' ' // 45
`define HDD_MODEL_NUMBER19                {8'h20, 8'h20}                                                        // ' ', ' ' // 46
`define HDD_MAX_MULTIPLE_SECTORS          16'd16                                                                // 47
`define HDD_DWORD_IO_SUPPORT              16'd1                                                                 // 48
`define HDD_LBA_SUPPORT                   (16'h1 << 9)                                                          // 49
`define HDD_RESERVED2                     16'd0                                                                 // 50
`define HDD_PIO_TIMING0                   16'h0200                                                              // 51
`define HDD_PIO_TIMING1                   16'h0200                                                              // 52
`define HDD_VALID_FIELDS                  16'h0007                                                              // 53
`define HDD_CURRENT_NUMBER_OF_CYLINDERS   ((`HDD_CYLINDERS > 16383) ? 16383 : `HDD_CYLINDERS)                   // 54
`define HDD_CURRENT_NUMBER_OF_HEADS       `HDD_HEADS                                                            // 55
`define HDD_CURRENT_NUMBER_OF_SPT         `HDD_SPT                                                              // 56
`define HDD_CURRENT_TOTAL_SECTORS_LOW     (`HDD_TOTAL_SECTORS & 16'hffff)                                       // 57
`define HDD_CURRENT_TOTAL_SECTORS_HIGH    (`HDD_TOTAL_SECTORS >> 16)                                            // 58
`define HDD_CURRENT_MULTIPLE_SECTORS      16'h0000                                                              // 59
`define HDD_CURRENT_ALLOCATED_SECTORS_LOW (`HDD_TOTAL_SECTORS & 16'hffff)                                       // 60
`define HDD_CURRENT_ALLOCATED_SECTORS_HIGH (`HDD_TOTAL_SECTORS >> 16)                                           // 61
`define HDD_SINGLE_WORD_DMA_MODES         16'h0000                                                              // 62
`define HDD_MULTIPLE_WORD_DMA_MODES       16'h0000                                                              // 63
`define HDD_PIO_MODES                     16'h0000                                                              // 64
`define HDD_MIN_CYCLE_TIME_OF_MULTIWORD_DMA        16'd120                                                      // 65
`define HDD_MIN_CYCLE_TIME_OF_MULTIWORD_DMA_DEVICE 16'd120                                                      // 66
`define HDD_MIN_CYCLE_TIME_OF_PIO_WITHOUT_IORDY    16'd120                                                      // 67
`define HDD_MIN_CYCLE_TIME_OF_PIO_WITH_IORDY       16'd120                                                      // 68
`define HDD_RESERVED3                     16'h0000                                                              // 69
`define HDD_RESERVED4                     16'h0000                                                              // 70
`define HDD_RESERVED5                     16'h0000                                                              // 71
`define HDD_RESERVED6                     16'h0000                                                              // 72
`define HDD_RESERVED7                     16'h0000                                                              // 73
`define HDD_RESERVED8                     16'h0000                                                              // 74
`define HDD_QUEUE_SIZE                    16'h0000                                                              // 75
`define HDD_RESERVED9                     16'h0000                                                              // 76
`define HDD_RESERVED10                    16'h0000                                                              // 77
`define HDD_RESERVED11                    16'h0000                                                              // 78
`define HDD_RESERVED12                    16'h0000                                                              // 79
`define HDD_ATA_MODES                     16'h007E                                                              // 80
`define HDD_MINOR_VERSION_NUMBER          16'h0000                                                              // 81
`define HDD_COMMANDS_SET0                 (16'h1 << 14)                                                         // 82
`define HDD_COMMANDS_SET1                 ((16'h1 << 14) | (16'h1 << 13) | (16'h1 << 12) | (16'h1 << 10))       // 83
`define HDD_COMMANDS_SET2                 (16'h1 << 14)                                                         // 84
`define HDD_COMMANDS_SET3                 (16'h1 << 14)                                                         // 85
`define HDD_COMMANDS_SET4                 ((16'h1 << 14) | (16'h1 << 13) | (16'h1 << 12) | (16'h1 << 10))       // 86
`define HDD_COMMANDS_SET5                 (16'h1 << 14)                                                         // 87
`define HDD_ULTRA_DMA_SUPPORT             16'h0000                                                              // 88
`define HDD_RESERVED13                    16'h0000                                                              // 89
`define HDD_RESERVED14                    16'h0000                                                              // 90
`define HDD_RESERVED15                    16'h0000                                                              // 91
`define HDD_RESERVED16                    16'h0000                                                              // 92
`define HDD_RESULT_OF_HARDWARE_RESET      (16'h1 | (16'h1 << 14) | 16'h2000)                                    // 93
`define HDD_RESERVED17                    16'h0000                                                              // 94~99
`define HDD_MAX_USER_LBA0                 (`HDD_TOTAL_SECTORS & 16'hffff)                                       // 100
`define HDD_MAX_USER_LBA1                 (`HDD_TOTAL_SECTORS >> 16)                                            // 101
`define HDD_RESERVED18                    16'h0000                                                              // 102~255

// RTC PARAMETERS
`define RTC_SECONDS                       8'h00                                                                 // 00
`define RTC_SECONDS_ALARM                 8'h00                                                                 // 01
`define RTC_MINUTES                       8'h00                                                                 // 02
`define RTC_MINUTES_ALARM                 8'h00                                                                 // 03
`define RTC_HOURS                         8'h12                                                                 // 04
`define RTC_HOURS_ALARM                   8'h12                                                                 // 05
`define RTC_DAYOFWEEK                     8'h01                                                                 // 06
`define RTC_DATEDAY                       8'h03                                                                 // 07
`define RTC_DATEMONTH                     8'h11                                                                 // 08
`define RTC_DATEYEAR                      8'h13                                                                 // 09
`define RTC_STATUSREGISTER_A              8'h26                                                                 // 0a
`define RTC_STATUSREGISTER_B              8'h02                                                                 // 0b
`define RTC_STATUSREGISTER_C              8'h00                                                                 // 0c
`define RTC_STATUSREGISTER_D              8'h80                                                                 // 0d
`define RTC_DIAGNOSTIC_STATUS             8'h00                                                                 // 0e
`define RTC_CMOS_SHUTDOWN_STATUS          8'h00                                                                 // 0f
`define RTC_FLOPPY_DRIVE_TYPE             8'h00                                                                 // 10
`define RTC_SYSTEM_CONFIG_SETTING         8'h00                                                                 // 11
`define RTC_HDD_TYPE                      8'hF0                                                                 // 12
`define RTC_TYPEMATIC_PARAMS              8'h00                                                                 // 13
`define RTC_INSTALLED_EQUIPMENTS          8'h0D                                                                 // 14
`define RTC_BASEMEMORY_LOW                8'h80                                                                 // 15
`define RTC_BASEMEMORY_HIGH               8'h02                                                                 // 16
`define RTC_EXTMEMORY_LOW                 ((`MEMORY_SIZE) > 1 ? (((`MEMORY_SIZE-1) << 10) & 8'hff) : 0)         // 17
`define RTC_EXTMEMORY_HIGH                ((`MEMORY_SIZE) > 1 ? (((`MEMORY_SIZE-1) << 2)  & 8'hff) : 0)         // 18
`define RTC_HDD0_EXTENDEDTYPE             8'h2F                                                                 // 19
`define RTC_HDD1_EXTENDEDTYPE             8'h00                                                                 // 1a
`define RTC_HDD0_CYLINDERS_LOW            (`HDD_CYLINDERS & 8'hff)                                              // 1b
`define RTC_HDD0_CYLINDERS_HIGH           (`HDD_CYLINDERS >> 8)                                                 // 1c
`define RTC_HDD0_HEADS                    (`HDD_HEADS)                                                          // 1d
`define RTC_HDD0_WRITE_PRECOMP_LOW        8'hff                                                                 // 1e
`define RTC_HDD0_WRITE_PRECOMP_HIGH       8'hff                                                                 // 1f
`define RTC_HDD0_CONTROL_BYTE             8'hc8                                                                 // 20
`define RTC_HDD0_LANDING_ZONE_LOW         (`HDD_CYLINDERS & 8'hff)                                              // 21
`define RTC_HDD0_LANDING_ZONE_HIGH        (`HDD_CYLINDERS >> 8)                                                 // 22
`define RTC_HDD0_SPT                      (`HDD_SPT)                                                            // 23
`define RTC_HDD1_CYLINDERS_LOW            8'h00                                                                 // 24
`define RTC_HDD1_CYLINDERS_HIGH           8'h00                                                                 // 25
`define RTC_HDD1_HEADS                    8'h00                                                                 // 26
`define RTC_HDD1_WRITE_PRECOMP_LOW        8'h00                                                                 // 27
`define RTC_HDD1_WRITE_PRECOMP_HIGH       8'h00                                                                 // 28
`define RTC_HDD1_CONTROL_BYTE             8'h00                                                                 // 29
`define RTC_HDD1_LANDING_ZONE_LOW         8'h00                                                                 // 2a
`define RTC_HDD1_LANDING_ZONE_HIGH        8'h00                                                                 // 2b
`define RTC_HDD1_SPT                      8'h00                                                                 // 2c
`define RTC_SYSTEM_OPERATIONAL_FLAGS      8'h00                                                                 // 2d
`define RTC_CMOS_CHECKSUM_HIGH            8'h00                                                                 // 2e
`define RTC_CMOS_CHECKSUM_LOW             8'h00                                                                 // 2f
`define RTC_MEMSIZE_ABOVE_1M_IN_1K_LOW    ((`MEMORY_SIZE) > 1 ? (((`MEMORY_SIZE-1) << 10) & 8'hff) : 0)         // 30
`define RTC_MEMSIZE_ABOVE_1M_IN_1K_HIGH   ((`MEMORY_SIZE) > 1 ? (((`MEMORY_SIZE-1) << 2)  & 8'hff) : 0)         // 31
`define RTC_IBM_CENTURY                   8'h20                                                                 // 32
`define RTC_POST_INFO_FLAGS               8'h00                                                                 // 33
`define RTC_MEMSIZE_ABOVE_16M_IN_64K_LOW  ((`MEMORY_SIZE) > 16 ? (((`MEMORY_SIZE-16) << 4) & 8'hff) : 0)        // 34
`define RTC_MEMSIZE_ABOVE_16M_IN_64K_HIGH ((`MEMORY_SIZE) > 16 ? (((`MEMORY_SIZE-16) >> 4) & 8'hff) : 0)        // 35
`define RTC_CHIPSET_SPECIFIC_INFO         8'h00                                                                 // 36
`define RTC_IBM_PS2_CENTURY               8'h20                                                                 // 37
`define RTC_ELTORITO_BOOT_SEQUENCE        8'h00                                                                 // 38
`define RTC_ATA_TRANSLATION_POLICY0       8'h00                                                                 // 39
`define RTC_ATA_TRANSLATION_POLICY1       8'h00                                                                 // 3a
`define RTC_3B                            8'h00                                                                 // 3b
`define RTC_3C                            8'h00                                                                 // 3c
`define RTC_3D                            8'h00                                                                 // 3d
`define RTC_3E                            8'h00                                                                 // 3e
`define RTC_3F                            8'h00                                                                 // 3f
