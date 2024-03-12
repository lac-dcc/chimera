/*
 *******************************************************************************
 *  Filename    :   ddr2_init_engine.v
 *
 *  Author(s)   :   Aditya Shevade      <aditya.shevade@gmail.com>
 *                  Gaurang Chaudhari   <gaurang.chaudhari@gmail.com>
 *  Version     :   1.0.0
 *
 *  Created     :   10/04/2011
 *
 *******************************************************************************
 */

module ddr2_init_engine #(
    parameter   BL  =   3'b011, // Burst Lenght = 8
                BT  =   1'b0,   // Burst Type = Sequential
                CL  =   3'b100, // CAS Latency (CL) = 4
                AL  =   3'b100  // Posted CAS# Additive Latency (AL) = 4
    ) (
    // Outputs
    ready, csbar, rasbar, casbar, webar, ba, a, dm, odt, ts_con, cke,
    // Inputs
    clk, reset, init
    );

    input           clk;
    input           reset;
    input           init;
    output          ready;
    output          csbar;
    output          rasbar;
    output          casbar;
    output          webar;
    output  [ 1:0]  ba;
    output  [12:0]  a;
    output  [ 1:0]  dm;
    output          odt;
    output          ts_con;
    output          cke;

    reg             cke;
    reg             csbar;
    reg             rasbar;
    reg             casbar;
    reg             webar;
    reg     [ 1:0]  ba;
    reg     [12:0]  a;
    reg     [ 1:0]  dm;
    reg             odt;
    reg             ready;
    reg     [15:0]  dq_out;
    reg     [ 1:0]  dqs_out;
    reg     [ 1:0]  dqsbar_out;
    reg             ts_con;
    reg     [12:0]  mrs, emrs;

    wire    [ 3:0]  cmd;
    reg     [16:0]  cntr_reg;
    reg     [ 4:0]  state_reg;

    assign  cmd =   {csbar, rasbar, casbar, webar}; // Used for plotting the command later on.

    localparam  [3:0]   NOP         =   4'b0111,    // NOP.
                        LM          =   4'b0000,    // MR and EMRs.
                        REFRESH     =   4'b0001,    // Refresh and Auto Refresh.
                        PRECHARGE   =   4'b0010;    // Precharge.

    // Better names are probably necesssary but this is just implementing the
    // initialization timing diagram as per the datasheet of the controller chip.
    // Each state is a vertical section from the timing diagram.
    localparam  [4:0]   S0  =   5'b00000,           // States for the state machine.
                        S1  =   5'b00001,
                        S2  =   5'b00011,
                        S3  =   5'b00010,
                        S4  =   5'b00110,
                        S5  =   5'b00111,
                        S6  =   5'b00101,
                        S7  =   5'b00100,
                        S8  =   5'b01100,
                        S9  =   5'b01101,
                        S10 =   5'b01111,
                        S11 =   5'b01110,
                        S12 =   5'b01010,
                        S13 =   5'b01011,
                        S14 =   5'b01001,
                        S15 =   5'b01000,
                        S16 =   5'b11000,
                        S17 =   5'b11001,
                        S18 =   5'b11011,
                        S19 =   5'b11010,
                        S20 =   5'b11110,
                        S21 =   5'b11111,
                        S22 =   5'b11101,
                        S23 =   5'b11100,
                        S24 =   5'b10100,
                        S25 =   5'b10101,
                        S26 =   5'b10111,
                        S27 =   5'b10110;

    always @ (posedge clk) begin    // Clk is 500MHz clock.
        if (reset) begin
            cke         <=  1'b0;
            odt         <=  1'b0;
            a           <=  13'b0;
            ba          <=  2'b0;
            ts_con      <=  1'b0;
		    cke         <=  1'b0;
		    csbar       <=  1'b0;
		    rasbar      <=  1'b1;
		    casbar      <=  1'b1;
		    webar       <=  1'b1;
            dqsbar_out  <=  2'b0;
            dm          <=  2'b0;
		    odt         <=  1'b0;
		    ready       <=  1'b0;
            cntr_reg    <=  17'b1_1000_0110_1010_0000; // 100,000 clocks = 200us + negedge of ck.
            state_reg   <=  S0;
        end else begin
            case (state_reg)
                // Wait till the init signal goes high.
                S0: begin
                    if (init)
                        state_reg   <=  S1;
                    else
                        state_reg   <=  S0;
                end

                // Wait for 200us of NOP
                // Then make cke high and wait for 200 cycles.
                S1: begin
                    if (!cntr_reg) begin
                        state_reg   <=  S2;
                        cntr_reg    <=  17'b0_0000_0000_1100_0111;
                        cke         <=  1'b1;
                    end else begin
                        state_reg   <=  S1;
                        cntr_reg    <=  cntr_reg - 1'b1;
                    end
                end

                // Wwait for 200 cycles.
                // Then give PRECHARGE for 2 cycles.
                // Make a[10] = 1.
                S2: begin
                    if (!cntr_reg) begin
                        state_reg   <=  S3;
                        cntr_reg    <=  17'b0_0000_0000_0000_0001;
                        {csbar, rasbar, casbar, webar}  <=  PRECHARGE;
                        a[10]       <=  1'b1;
                    end else begin
                        state_reg   <=  S2;
                        cntr_reg    <=  cntr_reg - 1'b1;
                    end
                end

                // Wait for 2 cycles of PRECHARGE.
                // Then give NOP for 8 cycles.
                S3: begin
                    if (!cntr_reg) begin
                        state_reg   <=  S4;
                        cntr_reg    <=  17'b0_0000_0000_0000_0111;
                        {csbar, rasbar, casbar, webar}  <=  NOP;
                    end else begin
                        state_reg   <=  S3;
                        cntr_reg    <=  cntr_reg - 1'b1;
                    end
                end

                // Wait for 8 cycles of NOP
                // Then give LM for 2 cycles.
                // Also make a = 0 and ba = 2'b10;
                S4: begin
                    if (!cntr_reg) begin
                        state_reg   <=  S5;
                        cntr_reg    <=  17'b0_0000_0000_0000_0001;
                        ba[1:0]     <=  2'b10;
                        a[12:0]     <=  13'b0;
                        {csbar, rasbar, casbar, webar}  <=  LM;
                    end else begin
                        state_reg   <=  S4;
                        cntr_reg    <=  cntr_reg - 1'b1;
                    end
                end

                S5: begin
                    if (!cntr_reg) begin
                        state_reg   <=  S6;
                        cntr_reg    <=  17'b0_0000_0000_0000_0011;
                        {csbar, rasbar, casbar, webar}  <=  NOP;
                    end else begin
                        state_reg   <=  S5;
                        cntr_reg    <=  cntr_reg - 1'b1;
                    end
                end

                S6: begin
                    if (!cntr_reg) begin
                        state_reg   <=  S7;
                        cntr_reg    <=  17'b0_0000_0000_0000_0001;
                        {csbar, rasbar, casbar, webar}  <=  LM;
                        ba[1:0]     <=  2'b11;
                        a[12:0]     <=  13'b0;
                    end else begin
                        state_reg   <=  S6;
                        cntr_reg    <=  cntr_reg - 1'b1;
                    end
                end

                S7: begin
                    if (!cntr_reg) begin
                        state_reg   <=  S8;
                        cntr_reg    <=  17'b0_0000_0000_0000_0011;
                        {csbar, rasbar, casbar, webar}  <=  NOP;
                    end else begin
                        state_reg   <=  S7;
                        cntr_reg    <=  cntr_reg - 1'b1;
                    end
                end

                S8: begin
                    if (!cntr_reg) begin
                        state_reg   <=  S9;
                        cntr_reg    <=  17'b0_0000_0000_0000_0001;
                        {csbar, rasbar, casbar, webar}  <=  LM;
                        ba[1:0]     <=  2'b01;
                        a[0]        <=  1'b0;   // DLL Enable = Enabled
                        a[1]        <=  1'b0;   // Output Driver Impedence Control (D.I.C) = Normal 100%
                        a[2]        <=  1'b0;   // Rtt ODT = off  (Until step 10)
                        a[6]        <=  1'b0;   // Rtt ODT = off  (Until step 10)
                        a[5:3]      <=  AL;     // Additive Latency = 3
                        a[9:7]      <=  3'b000; // OCD Calliberation Program = Exit
                        a[10]       <=  1'b1;   // DQS_bar = disabled
                        a[11]       <=  1'b0;   // RDQS = Disabled to enable DM (Data Mask)
                        a[12]       <=  1'b0;   // Qoff, Output Buffers = Enabled
                        //a[12:0]     <=  13'b0_0100_0001_1000;
                    end else begin
                        state_reg   <=  S8;
                        cntr_reg    <=  cntr_reg - 1'b1;
                    end
                end

                S9: begin
                    if (!cntr_reg) begin
                        state_reg   <=  S10;
                        cntr_reg    <=  17'b0_0000_0000_0000_0011;
                        {csbar, rasbar, casbar, webar}  <=  NOP;
                    end else begin
                        state_reg   <=  S9;
                        cntr_reg    <=  cntr_reg - 1'b1;
                    end
                end

                S10: begin
                    if (!cntr_reg) begin
                        state_reg   <=  S11;
                        cntr_reg    <=  17'b0_0000_0000_0000_0001;
                        {csbar, rasbar, casbar, webar}  <=  LM;
                        ba[1:0]     <=  2'b00;
                        a[2:0]      <=  BL;     // Burst Length = 4
                        a[3]        <=  BT;     //Burst type = Seq    @(posedge ck); // wait untill positive edge of the clock
                        a[6:4]      <=  CL;     // CAS_BAR latency = 4  ? Denali's rep emailed
                        a[7]        <=  1'b0;   // TM = Normal
                        a[8]        <=  1'b1;   // DLL Reset = Yes <------------------
                        a[11:9]     <=  3'b011; // Write recovery for autoprecharge = 4 cycles = approx tWR = 15 ns

                        // specified in MRS/EMRS command is less than 15 ns
                        // specified in SOMA file with current cycle time of 4 ns

                        a[12]       <= 0; // Active power down exit time (PD) = Fast Exit (use tXARD)
                        //a[12:0]     <=  13'b0_0111_0100_0010;
                    end else begin
                        state_reg   <=  S10;
                        cntr_reg    <=  cntr_reg - 1'b1;
                    end
                end

                S11: begin
                    if (!cntr_reg) begin
                        state_reg   <=  S12;
                        cntr_reg    <=  17'b0_0000_0000_0000_0011;
                        {csbar, rasbar, casbar, webar}  <=  NOP;
                    end else begin
                        state_reg   <=  S11;
                        cntr_reg    <=  cntr_reg - 1'b1;
                    end
                end

                S12: begin
                    if (!cntr_reg) begin
                        state_reg   <=  S13;
                        cntr_reg    <=  17'b0_0000_0000_0000_0001;
                        {csbar, rasbar, casbar, webar}  <=  PRECHARGE;
                        a[10]       <=  1'b1;
                    end else begin
                        state_reg   <=  S12;
                        cntr_reg    <=  cntr_reg - 1'b1;
                    end
                end

                S13: begin
                    if (!cntr_reg) begin
                        state_reg   <=  S14;
                        cntr_reg    <=  17'b0_0000_0000_0000_0111;
                        {csbar, rasbar, casbar, webar}  <=  NOP;
                    end else begin
                        state_reg   <=  S13;
                        cntr_reg    <=  cntr_reg - 1'b1;
                    end
                end

                S14: begin
                    if (!cntr_reg) begin
                        state_reg   <=  S15;
                        cntr_reg    <=  17'b0_0000_0000_0000_0001;
                        {csbar, rasbar, casbar, webar}  <=  REFRESH;
                    end else begin
                        state_reg   <=  S14;
                        cntr_reg    <=  cntr_reg - 1'b1;
                    end
                end

                S15: begin
                    if (!cntr_reg) begin
                        state_reg   <=  S16;
                        cntr_reg    <=  17'b0_0000_0001_1000_1111;
                        {csbar, rasbar, casbar, webar}  <=  NOP;
                    end else begin
                        state_reg   <=  S15;
                        cntr_reg    <=  cntr_reg - 1'b1;
                    end
                end

                S16: begin
                    if (!cntr_reg) begin
                        state_reg   <=  S17;
                        cntr_reg    <=  17'b0_0000_0000_0000_0001;
                        {csbar, rasbar, casbar, webar}  <=  REFRESH;
                    end else begin
                        state_reg   <=  S16;
                        cntr_reg    <=  cntr_reg - 1'b1;
                    end
                end

                S17: begin
                    if (!cntr_reg) begin
                        state_reg   <=  S18;
                        cntr_reg    <=  17'b0_0000_0001_1000_1111;
                        {csbar, rasbar, casbar, webar}  <=  NOP;
                    end else begin
                        state_reg   <=  S17;
                        cntr_reg    <=  cntr_reg - 1'b1;
                    end
                end

                S18: begin
                    if (!cntr_reg) begin
                        state_reg   <=  S19;
                        cntr_reg    <=  17'b0_0000_0000_0000_0001;
                        {csbar, rasbar, casbar, webar}  <=  LM;
                        ba[1:0]     <=  2'b00;
                        a[2:0]      <=  BL;     // Burst Length = 4
                        a[3]        <=  BT;     //Burst type = Sequential
                        a[6:4]      <=  CL;     // CAS_BAR latency = 4
                        a[7]        <=  1'b0;   // TM = Normal
                        a[8]        <=  1'b0;   // DLL Reset = No
                        a[11:9]     <=  3'b011; // Write recovery for autoprecharge = 4 cycles = approx tWR = 15 ns

                        // *Denali* Warning: <dtop.xddr2>@200442 ns :: twr value of 3.0 cycles
                        // specified in MRS/EMRS command is less than 15 ns
                        // specified in SOMA file with current cycle time of 4 ns

                        a[12]       <= 0;       // Active power down exit time (PD) = Fast Exit (use tXARD)
                        //a[12:0]     <=  13'b0_0110_0100_0010;
                    end else begin
                        state_reg   <=  S18;
                        cntr_reg    <=  cntr_reg - 1'b1;
                    end
                end

                S19: begin
                    if (!cntr_reg) begin
                        state_reg   <=  S20;
                        cntr_reg    <=  17'b0_0000_0001_1001_0101;
                        {csbar, rasbar, casbar, webar}  <=  NOP;
                    end else begin
                        state_reg   <=  S19;
                        cntr_reg    <=  cntr_reg - 1'b1;
                    end
                end

                S20: begin
                    if (!cntr_reg) begin
                        state_reg   <=  S21;
                        cntr_reg    <=  17'b0_0000_0000_0000_0001;
                        {csbar, rasbar, casbar, webar}  <=  LM;
                        ba[1:0]     <=  2'b01;
                        a[0]        <=  1'b0;   // DLL Enable = Enabled
                        a[1]        <=  1'b0;   // Output Driver Impedence Control (D.I.C) = Normal 100%
                        a[2]        <=  1'b1;   // Rtt ODT = 75 ohm
                        a[6]        <=  1'b0;   // Rtt ODT = 75 ohm
                        a[5:3]      <=  AL;     // Additive Latency = 3
                        a[9:7]      <=  3'b111; // OCD Calliberation Program = Default ????
                        a[10]       <=  1'b1;   // DQS_bar = disabled
                        a[11]       <=  1'b0;   // RDQS = Disabled to enable DM (Data Mask)
                        a[12]       <=  1'b0;   // Qoff, Output Buffers = Enabled
                        //a[12:0]     <=  13'b0_0111_1001_1100;
                    end else begin
                        state_reg   <=  S20;
                        cntr_reg    <=  cntr_reg - 1'b1;
                    end
                end

                S21: begin
                    if (!cntr_reg) begin
                        state_reg   <=  S22;
                        cntr_reg    <=  17'b0_0000_0000_0000_0011;
                        {csbar, rasbar, casbar, webar}  <=  NOP;
                    end else begin
                        state_reg   <=  S21;
                        cntr_reg    <=  cntr_reg - 1'b1;
                    end
                end

                S22: begin
                    if (!cntr_reg) begin
                        state_reg   <=  S23;
                        cntr_reg    <=  17'b0_0000_0000_0000_0001;
                        {csbar, rasbar, casbar, webar}  <=  LM;
                        a[9:7]      <=  3'b000;
                    end else begin
                        state_reg   <=  S23;
                        cntr_reg    <=  cntr_reg - 1'b1;
                    end
                end

                S23: begin
                    if (!cntr_reg) begin
                        state_reg   <=  S24;
                        cntr_reg    <=  17'b0_0000_0000_0000_0011;
                        {csbar, rasbar, casbar, webar}  <=  NOP;
                    end else begin
                        state_reg   <=  S23;
                        cntr_reg    <=  cntr_reg - 1'b1;
                    end
                end

                S24: begin
                    if (!cntr_reg) begin
                        state_reg   <=  S25;
                        cntr_reg    <=  17'b0_0000_0000_0000_0001;
                        {csbar, rasbar, casbar, webar}  <=  PRECHARGE;
                        a[10]       <=  1'b1;
                    end else begin
                        state_reg   <=  S24;
                        cntr_reg    <=  cntr_reg - 1'b1;
                    end
                end

                S25: begin
                    if (!cntr_reg) begin
                        state_reg   <=  S26;
                        cntr_reg    <=  17'b0_0000_0000_0000_0111;
                        {csbar, rasbar, casbar, webar}  <=  NOP;
                    end else begin
                        state_reg   <=  S25;
                        cntr_reg    <=  cntr_reg - 1'b1;
                    end
                end

                S26: begin
                    if (!cntr_reg) begin
                        state_reg   <=  S27;
                        cntr_reg    <=  17'b0_0000_0000_0000_0100;
                        odt         <=  1'b1;
                        ready       <=  1'b1;
                    end else begin
                        state_reg   <=  S26;
                        cntr_reg    <=  cntr_reg - 1'b1;
                    end
                end

                S27: begin
                    state_reg   <=  S27;
                    {csbar, rasbar, casbar, webar}  <=  NOP;
                end

                default: begin
                    state_reg   <=  S0;
                    cntr_reg    <=  17'b0_0000_0000_0000_0000;
                    {csbar, rasbar, casbar, webar}  <=  NOP;
                end

            endcase
        end
    end

endmodule

