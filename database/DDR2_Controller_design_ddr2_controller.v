/*
 *******************************************************************************
 *  Filename    :   ddr2_controller.v
 *
 *  Author      :   Aditya Shevade      <aditya.shevade@gmail.com>
 *                  Gaurang Chaudhari   <gaurang.chaudhari@gmail.com>
 *  Version     :   1.0.0
 *
 *  Created     :   10/04/2011
 *
 *******************************************************************************
 */

module ddr2_controller  (
    // OUTPUT
    DOUT, RADDR, FILLCOUNT, READY, C0_CK_PAD, C0_CKBAR_PAD, VALIDOUT, NOTFULL, C0_CKE_PAD, C0_CSBAR_PAD, C0_RASBAR_PAD, C0_CASBAR_PAD, C0_WEBAR_PAD, C0_BA_PAD, C0_A_PAD, C0_DM_PAD, C0_ODT_PAD,
    // INOUT
    C0_DQ_PAD, C0_DQS_PAD, C0_DQSBAR_PAD,
    // INPUT
    CLK, RESET, CMD, DIN, ADDR, INITDDR, SZ, OP, FETCHING
    );

    // Inputs
    input           CLK;
    input           RESET;
    input   [ 2:0]  CMD;
    input   [ 1:0]  SZ;
    input   [ 2:0]  OP;
    input           FETCHING;
    input   [15:0]  DIN;
    input   [24:0]  ADDR;
    input           INITDDR;
    // Outputs
    output  [15:0]  DOUT;
    output  [24:0]  RADDR;
    output  [ 6:0]  FILLCOUNT;
    output          VALIDOUT;
    output          NOTFULL;
    output          READY;
    output  [ 1:0]  C0_DM_PAD;
    output          C0_ODT_PAD;
    output          C0_CK_PAD;
    output          C0_CKBAR_PAD;
    output          C0_CKE_PAD;
    output          C0_CSBAR_PAD;
    output          C0_RASBAR_PAD;
    output          C0_CASBAR_PAD;
    output          C0_WEBAR_PAD;
    output  [ 1:0]  C0_BA_PAD;
    output  [12:0]  C0_A_PAD;
    // InOuts
    inout   [15:0]  C0_DQ_PAD;
    inout   [ 1:0]  C0_DQS_PAD;
    inout   [ 1:0]  C0_DQSBAR_PAD;


    wire    [15:0]  DOUT;       // From XRDFOUT of fifo.v
    wire    [15:0]  dq_o;       // From XSSTL of SSTL18DDR2INTERFACE.v
    wire    [ 1:0]  dqs_o;      // From XSSTL of SSTL18DDR2INTERFACE.v
    wire    [ 1:0]  dqsbar_o;   // From XSSTL of SSTL18DDR2INTERFACE.v
    wire            emptyBar;   // From XDFIN of fifo.v
    wire    [ 6:0]  FILLCOUNT;  // From XDFIN of fifo.v
    wire            NOTFULL;    // From XADDRFIN of fifo.v
    reg             VALIDOUT;

    wire    [24:0]  RADDR;
    wire            READY;
    wire    [ 1:0]  C0_DM_PAD;
    wire            C0_ODT_PAD;
    wire            C0_CK_PAD;
    wire            C0_CKBAR_PAD;
    wire            C0_CKE_PAD;
    wire            C0_CSBAR_PAD;
    wire            C0_RASBAR_PAD;
    wire            C0_CASBAR_PAD;
    wire            C0_WEBAR_PAD;
    wire    [ 1:0]  C0_BA_PAD;
    wire    [12:0]  C0_A_PAD;

    wire            ri_i;
    wire            ts_i;
    wire            ck_i;
    wire            cke_i;
    wire            csbar_i;
    wire            rasbar_i;
    wire            casbar_i;
    wire            webar_i;
    wire    [ 1:0]  ba_i;
    wire    [12:0]  a_i;
    wire    [15:0]  dq_i;
    wire    [ 1:0]  dqs_i;
    wire    [ 1:0]  dqsbar_i;
    wire    [ 1:0]  dm_i;
    wire            odt_i;

    wire            init_csbar;
    wire            init_rasbar;
    wire            init_webar;
    wire    [ 1:0]  init_ba;
    wire    [12:0]  init_a;
    wire    [ 1:0]  init_dm;
    wire            init_casbar;
    wire            init_odt;
    wire            init_ts_con;
    wire            init_cke;
    wire            csbar;
    wire            rasbar;
    wire            casbar;
    wire            webar;
    wire    [ 1:0]  ba;
    wire    [12:0]  a;

    parameter   BL  =   3'b011; // Burst Lenght = 8
    parameter   BT  =   1'b0;   // Burst Type = Sequential
    parameter   CL  =   3'b100; // CAS Latency (CL) = 4
    parameter   AL  =   3'b100; // Posted CAS# Additive Latency (AL) = 4

    localparam  [2:0]   NOP         =   3'b000, // Current command (from FIFO).
                        SCR         =   3'b001,
                        SCW         =   3'b010,
                        BLR         =   3'b011,
                        BLW         =   3'b100;

    localparam          PUT_ONE     =   1'b0,
                        PUT_TWO     =   1'b1;

    // ck is the slower 250 MHz clock used for clocking the memory.
    // ck divider and other logic
    reg ck;

    always @(posedge CLK) begin
        if (RESET)
            ck <= 1'b1;
        else
            ck <= ~ck;  // 250 MHz Clock
    end

    // FIFO related internal wires
    wire    [24:0]  addr_cmdFIFO;
    wire    [ 2:0]  cmd_cmdFIFO;
    wire    [ 1:0]  sz_cmdFIFO;
    wire    [ 2:0]  op_cmdFIFO;
    wire    [15:0]  din_dataFIFO;
    wire            emptyBar_cmdFIFO;
    wire            emptyBar_dataFIFO;
    wire            emptyBar_returnFIFO;
    wire    [24:0]  addr_returnFIFO;
    wire            put_returnFIFO;
    wire            get_cmdFIFO;
    wire            get_dataFIFO;
    wire            notfull_cmdFIFO;
    wire            notfull_dataFIFO;
    wire            fullBar_returnFIFO;
    wire    [15:0]  ringBuff_returnFIFO;
    wire    [ 2:0]  readPtr_ringBuff;
    wire    [ 6:0]  fillcount_returnFIFO;

    wire    [32:0]  in_xaddrfin;
    assign in_xaddrfin =  {ADDR[24:0], CMD[2:0], SZ[1:0], OP[2:0]};

    // Valid signal delayed to meet timing errors. This just delayes the
    // output by one cycle.
    always @ (posedge CLK) begin
        VALIDOUT    <=  emptyBar_returnFIFO;
    end

    // Hack on notfull. The design I initially wrote for controlling the data
    // and command FIFOs involved putting and properly filtering the unknown
    // values from them (by keeping them aligned).
    //
    // The testbench, however, keeps putting unknowns even after it has
    // finished the valid commands (instead of either going to Z or giving
    // a NOP. So I had to abandon that and due to lack of time, this method
    // was used where the care is taken that data fifo is never full (worst
    // case being 32 words for a burst write.
    //
    // This, again, only delayes the data (more clocks) and has no other effect on the
    // operation.
    assign  NOTFULL = !(FILLCOUNT >= 33 || (!notfull_cmdFIFO));

    reg             put_dataFIFO_reg;
    reg             put_dataFIFO;
    reg             put_cmdFIFO;
    reg     [4:0]   putFIFOCnt_reg;
    reg             putFIFO_state;

    // Logic to put the command and data in the FIFOs. The testbench is
    // written in a peculiar way so keeping the FIFOs aligned was out of
    // consideration.
    //
    // Instead of using a single FIFO for both the commands and data (since we
    // never use them at the same time), two FIFOs are used and so we have to
    // make put command high for one cycle and depending on its value make
    // data put signal high or low and for appropriate cycles.
    always @ (CMD or NOTFULL or put_dataFIFO_reg) begin
        if (put_dataFIFO_reg) begin
            put_dataFIFO    =   1'b1;
            put_cmdFIFO     =   1'b0;
        end else begin
            if (!NOTFULL) begin
                put_dataFIFO    =   1'b0;
                put_cmdFIFO     =   1'b0;
            end else begin
                case (CMD)
                    BLR: begin
                        put_dataFIFO    =   1'b0;
                        put_cmdFIFO     =   1'b1;
                    end
                    BLW: begin
                        put_dataFIFO    =   1'b1;
                        put_cmdFIFO     =   1'b1;
                    end
                    SCR: begin
                        put_dataFIFO    =   1'b0;
                        put_cmdFIFO     =   1'b1;
                    end
                    SCW: begin
                        put_dataFIFO    =   1'b1;
                        put_cmdFIFO     =   1'b1;
                    end
                    NOP: begin
                        put_dataFIFO    =   1'b0;
                        put_cmdFIFO     =   1'b0;
                    end
                    default: begin
                        put_dataFIFO    =   1'b0;
                        put_cmdFIFO     =   1'b0;
                    end
                endcase
            end
        end
    end

    // This block just controls the number of cycles for which the put data
    // signal must be true (in block write, 8 for SZ = 0, 16 for SZ = 1 and so
    // on).
    always @ (posedge CLK) begin
        if (RESET) begin
            putFIFO_state       <=  PUT_ONE;
            putFIFOCnt_reg      <=  5'b0_0000;
            put_dataFIFO_reg    <=  1'b0;
        end else begin
            case (putFIFO_state)
                PUT_ONE: begin
                    putFIFOCnt_reg      <=  5'b0_0000;
                    put_dataFIFO_reg    <=  1'b0;
                    if (CMD == BLW && put_cmdFIFO) begin
                        putFIFO_state       <=  PUT_TWO;
                        put_dataFIFO_reg    <=  1'b1;
                        case (SZ)
                            2'b00: begin
                                putFIFOCnt_reg      <=  5'b0_0110;
                            end
                            2'b01: begin
                                putFIFOCnt_reg      <=  5'b0_1110;
                            end
                            2'b10: begin
                                putFIFOCnt_reg      <=  5'b1_0110;
                            end
                            2'b11: begin
                                putFIFOCnt_reg      <=  5'b1_1110;
                            end
                            default: begin
                                putFIFOCnt_reg      <=  5'b0_0000;
                                putFIFO_state       <=  PUT_ONE;
                            end
                        endcase
                    end
                end

                PUT_TWO: begin
                    if (!putFIFOCnt_reg) begin
                        putFIFO_state       <=  PUT_ONE;
                        put_dataFIFO_reg    <=  1'b0;
                        putFIFOCnt_reg      <=  5'b0_0000;
                    end else begin
                        putFIFOCnt_reg      <=  putFIFOCnt_reg - 1'b1;
                    end
                end
            endcase
        end
    end


    // Original logic to align both FIFOs and fetch command only when the
    // operation was done (so the command is valid).
    //
    // This works till the end of the test pattern but after the final
    // command, the input command is X and so the tests run infinitely. If the
    // testbench does not give X after the pattern is over, this code also
    // works fine and without the data fifo hack.

    /*
    reg     [ 5:0]  putCnt_reg;
    reg             put_cmdFIFO;
    reg             put_cmdFIFO_wire;

    always @ (posedge CLK) begin
        if (RESET) begin
            putCnt_reg  <=  4'b0000;
        end else if (READY && NOTFULL && notfull_dataFIFO) begin
            put_cmdFIFO <=  1'b1;
            if (!putCnt_reg) begin
                put_cmdFIFO <=  1'b0;
                case (CMD)
                    3'b001: begin
                        putCnt_reg  <=  4'b0000;
                        put_cmdFIFO <=  1'b0;
                    end
                    3'b010: begin
                        putCnt_reg  <=  4'b0000;
                        put_cmdFIFO <=  1'b0;
                    end
                    3'b011: begin
                        putCnt_reg  <=  4'b0000;
                        put_cmdFIFO <=  1'b0;
                    end
                    3'b100: begin
                        case (SZ)
                            2'b00: begin
                                putCnt_reg  <=  6'b00_0110;
                                put_cmdFIFO <=  1'b1;
                            end

                            2'b01: begin
                                putCnt_reg  <=  6'b00_1110;
                                put_cmdFIFO <=  1'b1;
                            end

                            2'b10: begin
                                putCnt_reg  <=  6'b01_0110;
                                put_cmdFIFO <=  1'b1;
                            end

                            2'b11: begin
                                putCnt_reg  <=  6'b01_1110;
                                put_cmdFIFO <=  1'b1;
                            end

                            default: begin
                            end
                        endcase
                    end

                    default: begin
                    end
                endcase
            end else begin
                putCnt_reg  <=  putCnt_reg - 1'b1;
            end
        end else begin
            put_cmdFIFO <=  1'b0;
        end

        if (get_dataFIFO && !notfull_dataFIFO)
            put_cmdFIFO <= 1'b1;
    end

    always @ (put_cmdFIFO or NOTFULL or CMD or get_dataFIFO) begin
        if (put_cmdFIFO && NOTFULL) begin
            put_cmdFIFO_wire = put_cmdFIFO & NOTFULL;
        end else begin
            case (CMD)
                3'b001: begin
                    put_cmdFIFO_wire = 1'b1;
                end
                3'b010: begin
                    put_cmdFIFO_wire = 1'b1;
                end
                3'b011: begin
                    put_cmdFIFO_wire = 1'b1;
                end
                3'b100: begin
                    put_cmdFIFO_wire = 1'b1;
                end
                default: begin
                    put_cmdFIFO_wire = 1'b0;
                end
            endcase
        end
        if (!NOTFULL) begin
            put_cmdFIFO_wire = 1'b0;
        end
    end
    */

    FIFO #(16,6) FIFO_DATA (
        // Outputs
        .fillcount      (FILLCOUNT[6:0]), // To outside
        .data_out       (din_dataFIFO),
        .full_bar       (notfull_dataFIFO),
        .empty_bar      (emptyBar_dataFIFO),
        // Inputs
        .clk            (CLK),
        .reset          (RESET),
        .get            (get_dataFIFO),
        .put            (put_dataFIFO), // TODO: Which signal is this? Should be from TB.
        .data_in        (DIN) // From outside
    );

    FIFO #(33,6) FIFO_CMD (
        // Outputs
        .fillcount      (),
        .data_out       ({addr_cmdFIFO,cmd_cmdFIFO,sz_cmdFIFO,op_cmdFIFO}),
        .full_bar       (notfull_cmdFIFO), // To outside
        .empty_bar      (emptyBar_cmdFIFO),
        // Inputs
        .clk            (CLK),
        .reset          (RESET),
        .get            (get_cmdFIFO),
        .put            (put_cmdFIFO),
        .data_in        (in_xaddrfin) // From outside.
    );

    FIFO #(41,6) FIFO_RETURN (
        // Outputs
        .fillcount      (fillcount_returnFIFO),
        .data_out       ({RADDR,DOUT}), // To outside
        .full_bar       (fullBar_returnFIFO),
        .empty_bar      (emptyBar_returnFIFO), // To outside
        // Inputs
        .clk            (CLK),
        .reset          (RESET),
        .get            (FETCHING), // From outside
        .put            (put_returnFIFO),
        .data_in        ({addr_returnFIFO,ringBuff_returnFIFO})

    );

    defparam XINIT.BL   =   BL;
    defparam XINIT.AL   =   AL;
    defparam XINIT.CL   =   CL;
    defparam XINIT.BT   =   BT;

    // instantiate the initialization engine module
    ddr2_init_engine XINIT (
        //Outputs
        .ready          (READY),
        .csbar          (init_csbar),
        .rasbar         (init_rasbar),
        .casbar         (init_casbar),
        .webar          (init_webar),
        .ba             (init_ba),
        .a              (init_a),
        .dm             (init_dm),
        .odt            (init_odt),
        .ts_con         (init_ts_con),
        .cke            (init_cke),
        // Inputs
        .clk            (CLK),
        .reset          (RESET),
        .init           (INITDDR)
    );

    defparam TPL.BL   =   BL;
    defparam TPL.AL   =   AL;
    defparam TPL.CL   =   CL;
    defparam TPL.BT   =   BT;

    // instantiate the transaction processing logic
    process_logic TPL (
        // general inputs
        .ready_init_i           (READY),
        .clk                    (CLK),
        .CK                     (ck),
        .reset                  (RESET),
        // fifo related signals
        .addr_cmdFIFO_i         (addr_cmdFIFO),
        .cmd_cmdFIFO_i          (cmd_cmdFIFO),
        .sz_cmdFIFO_i           (sz_cmdFIFO),
        .op_cmdFIFO_i           (op_cmdFIFO),
        .din_dataFIFO_i         (din_dataFIFO),
        .emptyBar_cmdFIFO_i     (emptyBar_cmdFIFO),
        .fullBar_returnFIFO_i   (fullBar_returnFIFO),
        .fillcount_returnFIFO_i (fillcount_returnFIFO),

        .addr_returnFIFO_o      (addr_returnFIFO),
        .get_cmdFIFO_o          (get_cmdFIFO),
        .get_dataFIFO_o         (get_dataFIFO),
        .put_returnFIFO_o       (put_returnFIFO),
        // address
        .ba                     (ba),
        .a                      (a),

        .csbar_o                (csbar),
        .rasbar_o               (rasbar),
        .casbar_o               (casbar),
        .webar_o                (webar),

        .listen_ringBuff_o      (listen_ringBuff), // To ring buffer
        .readPtr_ringBuff_o     (readPtr_ringBuff), // To ring buffer
        .dq_SSTL_o              (dq_i), // To SSTL
        .dm_SSTL_o              (dm_i),
        .dqs_i_SSTL_o           (dqs_i),
        .ts_i_o                 (ts_i),
        .ri_i_o                 (ri_i)
    );

    ddr2_ring_buffer8 ring (
        .dout       (ringBuff_returnFIFO),
        .listen     (listen_ringBuff),
        .strobe     (dqs_o[0]),
        .reset      (RESET),
        .din        (dq_o),
        .readPtr    (readPtr_ringBuff)
    );

    // instantiate SSTL interface
    SSTL18DDR2INTERFACE XSSTL (
        // Outputs
        .ck_pad         (C0_CK_PAD),
        .ckbar_pad      (C0_CKBAR_PAD),
        .cke_pad        (C0_CKE_PAD),
        .csbar_pad      (C0_CSBAR_PAD),
        .rasbar_pad     (C0_RASBAR_PAD),
        .casbar_pad     (C0_CASBAR_PAD),
        .webar_pad      (C0_WEBAR_PAD),
        .ba_pad         (C0_BA_PAD[1:0]),
        .a_pad          (C0_A_PAD[12:0]),
        .dm_pad         (C0_DM_PAD[1:0]),
        .odt_pad        (C0_ODT_PAD),
        .dq_o           (dq_o[15:0]),
        .dqs_o          (dqs_o[1:0]),
        .dqsbar_o       (dqsbar_o[1:0]),
        // Inouts
        .dq_pad         (C0_DQ_PAD[15:0]),
        .dqs_pad        (C0_DQS_PAD[1:0]),
        .dqsbar_pad     (),
        // Inputs
        .ri_i           (ri_i),                 //write => ts=1, read => ri=1 and make the other 0
        .ts_i           (ts_i),
        .ck_i           (ck_i),
        .cke_i          (cke_i),
        .csbar_i        (csbar_i),
        .rasbar_i       (rasbar_i),
        .casbar_i       (casbar_i),
        .webar_i        (webar_i),
        .ba_i           (ba_i[1:0]),
        .a_i            (a_i[12:0]),
        .dq_i           (dq_i[15:0]),
        .dqs_i          (dqs_i[1:0]),
        .dqsbar_i       (),
        .dm_i           (dm_i[1:0]),
        .odt_i          (odt_i)
    );


    // Output Mux for control signals
    assign  a_i         = (READY) ? a      : init_a;
    assign  ba_i        = (READY) ? ba     : init_ba;

    assign  csbar_i     = (READY) ? csbar  : init_csbar;
    assign  rasbar_i    = (READY) ? rasbar : init_rasbar;
    assign  casbar_i    = (READY) ? casbar : init_casbar;
    assign  webar_i     = (READY) ? webar  : init_webar;

    assign  cke_i       = init_cke;
    assign  odt_i       = init_odt;
    assign  ck_i        = ck;

endmodule // ddr2_controller

