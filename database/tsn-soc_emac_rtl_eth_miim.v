// This program was cloned from: https://github.com/lvzhengde/tsn-soc
// License: BSD 3-Clause "New" or "Revised" License

/*+
 * Copyright (c) 2022-2023 Zhengde
 *
 * Copyright (c) 2001 Igor Mohor (igorM@opencores.org) 
 * 
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 * 
 * 1 Redistributions of source code must retain the above copyright notice, this
 *   list of conditions and the following disclaimer.
 * 
 * 2 Redistributions in binary form must reproduce the above copyright notice,
 *   this list of conditions and the following disclaimer in the documentation
 *   and/or other materials provided with the distribution.
 * 
 * 3 Neither the name of the copyright holder nor the names of its
 *   contributors may be used to endorse or promote products derived from
 *   this software without specific prior written permission.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-*/

/*+
 * Ethernet MII management register interface
-*/

module eth_miim (
    input            Clk,                  // Host Clock
    input            rst_n,                // Reset, active low

    input   [7:0]    Divider_i,            // Divider for the host clock
    input   [15:0]   CtrlData_i,           // Control Data (to be written to the PHY reg.)
    input   [4:0]    Rgad_i,               // Register Address (within the PHY)
    input   [4:0]    Fiad_i,               // PHY Address
    input            NoPre_i,              // No Preamble (no 32-bit preamble)
    input            WCtrlData_i,          // Write Control Data operation
    input            RStat_i,              // Read Status operation
    input            ScanStat_i,           // Scan Status operation
    input            Mdi_i,                // MII Management Data In
    
    output           Mdc_o,                // MII Management Data Clock
    output           Mdo_o,                // MII Management Data Output
    output           MdoEn_o,              // MII Management Data Output Enable
    output           Busy_o,               // Busy Signal
    output           LinkFail_o,           // Link Integrity Signal
    output reg       Nvalid_o,             // Invalid Status (qualifier for the valid scan result)
    
    output  [15:0]   Prsd_o,               // Read Status Data (data read from the PHY)
    
    output reg       WCtrlDataStart_o,     // This signals resets the WCTRLDATA bit in the MIIM Command register
    output reg       RStatStart_o,         // This signal resets the RSTAT BIT in the MIIM Command register
    output reg       UpdateMIIRX_DATAReg_o // Updates MII RX_DATA register with read data
);

    reg           EndBusy_d;          // Pre-end Busy signal
    reg           EndBusy;            // End Busy signal (stops the operation in progress)
    
    reg           WCtrlData_q1;       // Write Control Data operation delayed 1 Clk cycle
    reg           WCtrlData_q2;       // Write Control Data operation delayed 2 Clk cycles
    reg           WCtrlData_q3;       // Write Control Data operation delayed 3 Clk cycles
    reg           WCtrlDataStart_q;
    reg           WCtrlDataStart_q1;  // Start Write Control Data Command delayed 1 Mdc cycle
    reg           WCtrlDataStart_q2;  // Start Write Control Data Command delayed 2 Mdc cycles
    
    reg           RStat_q1;           // Read Status operation delayed 1 Clk cycle
    reg           RStat_q2;           // Read Status operation delayed 2 Clk cycles
    reg           RStat_q3;           // Read Status operation delayed 3 Clk cycles
    reg           RStatStart_q1;      // Start Read Status Command delayed 1 Mdc cycle
    reg           RStatStart_q2;      // Start Read Status Command delayed 2 Mdc cycles
    
    reg           ScanStat_q1;        // Scan Status operation delayed 1 cycle
    reg           ScanStat_q2;        // Scan Status operation delayed 2 cycles
    reg           SyncStatMdcEn;      // Scan Status operation delayed at least cycles and synchronized to MdcEn
    
    wire          WriteDataOp;        // Write Data Operation (positive edge detected)
    wire          ReadStatusOp;       // Read Status Operation (positive edge detected)
    wire          ScanStatusOp;       // Scan Status Operation (positive edge detected)
    wire          StartOp;            // Start Operation (start of any of the preceding operations)
    wire          EndOp;              // End of Operation
    
    reg           InProgress;         // Operation in progress
    reg           InProgress_q1;      // Operation in progress delayed 1 Mdc cycle
    reg           InProgress_q2;      // Operation in progress delayed 2 Mdc cycles
    reg           InProgress_q3;      // Operation in progress delayed 3 Mdc cycles
    
    reg           WriteOp;            // Write Operation Latch (When asserted, write operation is in progress)
    reg     [6:0] BitCounter;         // Bit Counter
    
    
    wire    [3:0] ByteSelect;         // Byte Select defines which byte (preamble, data, operation, etc.) 
                                      //is loaded and shifted through the shift register.
    wire          MdcEn;              // MII Management Data Clock Enable signal is asserted for one Clk period before Mdc rises.
    wire          ShiftedBit;         // This bit is output of the shift register and is connected to the Mdo signal
    wire          MdcEn_n;
    
    wire          LatchByte1_d2;
    wire          LatchByte0_d2;
    reg           LatchByte1_d;
    reg           LatchByte0_d;
    reg     [1:0] LatchByte;          // Latch Byte selects which part of Read Status Data is updated from the shift register


    // Generation of the EndBusy signal. It is used for ending the MII Management operation.
    always @ (posedge Clk or negedge rst_n) begin
        if(!rst_n) begin
            EndBusy_d <=  1'b0;
            EndBusy <=  1'b0;
        end
        else begin
            EndBusy_d <=  ~InProgress_q2 & InProgress_q3;
            EndBusy   <=  EndBusy_d;
        end
    end

    // Update MII RX_DATA register
    always @ (posedge Clk or negedge rst_n) begin
        if(!rst_n)
            UpdateMIIRX_DATAReg_o <=  0;
        else if(EndBusy & ~WCtrlDataStart_q)
            UpdateMIIRX_DATAReg_o <=  1;
        else
            UpdateMIIRX_DATAReg_o <=  0;    
    end

    // Generation of the delayed signals used for positive edge triggering.
    always @ (posedge Clk or negedge rst_n) begin
        if(!rst_n) begin
            WCtrlData_q1 <=  1'b0;
            WCtrlData_q2 <=  1'b0;
            WCtrlData_q3 <=  1'b0;
            
            RStat_q1 <=  1'b0;
            RStat_q2 <=  1'b0;
            RStat_q3 <=  1'b0;
    
            ScanStat_q1  <=  1'b0;
            ScanStat_q2  <=  1'b0;
            SyncStatMdcEn <=  1'b0;
        end
        else begin
            WCtrlData_q1 <=  WCtrlData_i;
            WCtrlData_q2 <=  WCtrlData_q1;
            WCtrlData_q3 <=  WCtrlData_q2;
    
            RStat_q1 <=  RStat_i;
            RStat_q2 <=  RStat_q1;
            RStat_q3 <=  RStat_q2;
    
            ScanStat_q1  <=  ScanStat_i;
            ScanStat_q2  <=  ScanStat_q1;

            if(MdcEn)
                SyncStatMdcEn  <=  ScanStat_q2;
        end
    end

    // Generation of the Start Commands (Write Control Data or Read Status)
    always @ (posedge Clk or negedge rst_n) begin
        if(!rst_n) begin
            WCtrlDataStart_o <=  1'b0;
            WCtrlDataStart_q <=  1'b0;
            RStatStart_o <=  1'b0;
        end
        else begin
            if(EndBusy) begin
                WCtrlDataStart_o <=  1'b0;
                RStatStart_o <=  1'b0;
            end
            else begin
                if(WCtrlData_q2 & ~WCtrlData_q3)
                    WCtrlDataStart_o <=  1'b1;
                if(RStat_q2 & ~RStat_q3)
                    RStatStart_o <=  1'b1;
                WCtrlDataStart_q <=  WCtrlDataStart_o;
            end
        end
    end 


    // Generation of the Nvalid signal (indicates when the status is invalid)
    always @ (posedge Clk or negedge rst_n) begin
        if(!rst_n)
            Nvalid_o <=  1'b0;
        else begin
            if(~InProgress_q2 & InProgress_q3) begin
                Nvalid_o <=  1'b0;
            end
            else begin
                if(ScanStat_q2  & ~SyncStatMdcEn)
                    Nvalid_o <=  1'b1;
            end
        end
    end 

    // Signals used for the generation of the Operation signals (positive edge)
    always @ (posedge Clk or negedge rst_n) begin
        if(!rst_n) begin
            WCtrlDataStart_q1 <=  1'b0;
            WCtrlDataStart_q2 <=  1'b0;
    
            RStatStart_q1 <=  1'b0;
            RStatStart_q2 <=  1'b0;
    
            InProgress_q1 <=  1'b0;
            InProgress_q2 <=  1'b0;
            InProgress_q3 <=  1'b0;
    
            LatchByte0_d <=  1'b0;
            LatchByte1_d <=  1'b0;
    
            LatchByte <=  2'b00;
        end
        else begin
            if(MdcEn) begin
                WCtrlDataStart_q1 <=  WCtrlDataStart_o;
                WCtrlDataStart_q2 <=  WCtrlDataStart_q1;
    
                RStatStart_q1 <=  RStatStart_o;
                RStatStart_q2 <=  RStatStart_q1;
    
                LatchByte[0] <=  LatchByte0_d;
                LatchByte[1] <=  LatchByte1_d;
    
                LatchByte0_d <=  LatchByte0_d2;
                LatchByte1_d <=  LatchByte1_d2;
    
                InProgress_q1 <=  InProgress;
                InProgress_q2 <=  InProgress_q1;
                InProgress_q3 <=  InProgress_q2;
            end
        end
    end 


    // Generation of the Operation signals
    assign WriteDataOp  = WCtrlDataStart_q1 & ~WCtrlDataStart_q2;    
    assign ReadStatusOp = RStatStart_q1     & ~RStatStart_q2;
    assign ScanStatusOp = SyncStatMdcEn     & ~InProgress & ~InProgress_q1 & ~InProgress_q2;
    assign StartOp      = WriteDataOp | ReadStatusOp | ScanStatusOp;
    
    // Busy
    assign Busy_o = WCtrlData_i | WCtrlDataStart_o | RStat_i | RStatStart_o | SyncStatMdcEn | EndBusy | InProgress | InProgress_q3 | Nvalid_o;

    // Generation of the InProgress signal (indicates when an operation is in progress)
    // Generation of the WriteOp signal (indicates when a write is in progress)
    always @ (posedge Clk or negedge rst_n) begin
        if(!rst_n) begin
            InProgress <=  1'b0;
            WriteOp <=  1'b0;
        end
        else begin
            if(MdcEn) begin
                if(StartOp) begin
                    if(~InProgress)
                        WriteOp <=  WriteDataOp;
                    InProgress <=  1'b1;
                end
                else begin
                    if(EndOp) begin
                        InProgress <=  1'b0;
                        WriteOp <=  1'b0;
                    end
                end
            end
        end
    end

    // Bit Counter counts from 0 to 63 (from 32 to 63 when NoPre is asserted)
    always @ (posedge Clk or negedge rst_n) begin
        if(!rst_n)
          BitCounter[6:0] <=  7'h0;
        else begin
            if(MdcEn) begin
                if(InProgress) begin
                    if(NoPre_i & ( BitCounter == 7'h0 ))
                        BitCounter[6:0] <=  7'h21;
                    else
                        BitCounter[6:0] <=  BitCounter[6:0] + 1;
                end
                else
                  BitCounter[6:0] <=  7'h0;
            end
        end
    end

    // Operation ends when the Bit Counter reaches 63
    assign EndOp = BitCounter==63;
    
    assign ByteSelect[0] = InProgress & ((NoPre_i & (BitCounter == 7'h0)) | (~NoPre_i & (BitCounter == 7'h20)));
    assign ByteSelect[1] = InProgress & (BitCounter == 7'h28);
    assign ByteSelect[2] = InProgress & WriteOp & (BitCounter == 7'h30);
    assign ByteSelect[3] = InProgress & WriteOp & (BitCounter == 7'h38);
    
    
    // Latch Byte selects which part of Read Status Data is updated from the shift register
    assign LatchByte1_d2 = InProgress & ~WriteOp & BitCounter == 7'h37;
    assign LatchByte0_d2 = InProgress & ~WriteOp & BitCounter == 7'h3F;


    // Connecting the Clock Generator Module
    eth_clockgen clkgen
    (
        .Clk                   (Clk), 
        .rst_n                 (rst_n), 
        .Divider_i             (Divider_i[7:0]), 
        .MdcEn_o               (MdcEn), 
        .MdcEn_n_o             (MdcEn_n), 
        .Mdc_o                 (Mdc_o) 
    );

    // Connecting the Shift Register Module
    eth_shiftreg shftrg
    (
        .Clk                   (Clk), 
        .rst_n                 (rst_n), 
        .MdcEn_n_i             (MdcEn_n), 
        .Mdi_i                 (Mdi_i), 
        .Fiad_i                (Fiad_i), 
        .Rgad_i                (Rgad_i), 
        .CtrlData_i            (CtrlData_i), 
        .WriteOp_i             (WriteOp), 
        .ByteSelect_i          (ByteSelect), 
        .LatchByte_i           (LatchByte), 

        .ShiftedBit_o          (ShiftedBit), 
        .Prsd_o                (Prsd_o), 
        .LinkFail_o            (LinkFail_o)
    );
    
    // Connecting the Output Control Module
    eth_outputcontrol outctrl
    (
        .Clk                  (Clk), 
        .rst_n                (rst_n), 
        .MdcEn_n_i            (MdcEn_n), 
        .InProgress_i         (InProgress), 
                              
        .ShiftedBit_i         (ShiftedBit), 
        .BitCounter_i         (BitCounter), 
        .WriteOp_i            (WriteOp), 
        .NoPre_i              (NoPre_i), 
                              
        .Mdo_o                (Mdo_o), 
        .MdoEn_o              (MdoEn_o)
    );

endmodule
