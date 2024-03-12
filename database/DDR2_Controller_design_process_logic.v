/*
 *******************************************************************************
 *  Filename    :   ddr2_controller.v
 *
 *  Author      :   Aditya Shevade      <aditya.shevade@gmail.com>
 *                  Gaurang Chaudhari   <gaurang.chaudhari@gmail.com>
 *  Version     :   2.0.0
 *
 *  Created     :   10/12/2011
 *  Modified    :   10/31/2011
 *
 *  Changelog   :
 *
 *******************************************************************************
 */

module process_logic #(
    parameter   BL  =   3'b011, // Burst Lenght = 8
                BT  =   1'b0,   // Burst Type = Sequential
                CL  =   3'b100, // CAS Latency (CL) = 4
                AL  =   3'b100  // Posted CAS# Additive Latency (AL) = 4
    )(
    // Generic inputs
    ready_init_i, clk, reset, CK,
    // FIFO realted inputs
    addr_cmdFIFO_i, cmd_cmdFIFO_i, sz_cmdFIFO_i, op_cmdFIFO_i, din_dataFIFO_i, emptyBar_cmdFIFO_i, fullBar_returnFIFO_i, fillcount_returnFIFO_i, 
    // Address outputs
    ba, a,
    // Outputs
    addr_returnFIFO_o, get_cmdFIFO_o, get_dataFIFO_o, put_returnFIFO_o, csbar_o, rasbar_o, casbar_o, webar_o, readPtr_ringBuff_o, listen_ringBuff_o, dq_SSTL_o, dm_SSTL_o, dqs_i_SSTL_o, ts_i_o, ri_i_o
    );
 
    // Inputs
    input           ready_init_i;
    input           clk;
    input           CK;
    input           reset;
    input   [24:0]  addr_cmdFIFO_i;
    input   [ 2:0]  cmd_cmdFIFO_i;
    input   [ 1:0]  sz_cmdFIFO_i; 
    input   [ 2:0]  op_cmdFIFO_i; 
    input   [15:0]  din_dataFIFO_i;
    input           emptyBar_cmdFIFO_i;
    input           fullBar_returnFIFO_i;
    input   [ 6:0]  fillcount_returnFIFO_i;
    
    // Output
    output  [24:0]  addr_returnFIFO_o; 
    output          get_cmdFIFO_o; 
    output          get_dataFIFO_o; 
    output          put_returnFIFO_o;
    output          csbar_o, rasbar_o, casbar_o, webar_o;
    output  [ 2:0]  readPtr_ringBuff_o; 
    output          listen_ringBuff_o;
    output  [15:0]  dq_SSTL_o;
    output  [ 1:0]  dm_SSTL_o;
    output  [ 1:0]  dqs_i_SSTL_o;
    output  [ 1:0]  ba;
    output  [12:0]  a;
    output          ts_i_o;
    output          ri_i_o;
    
    // Output Reg
    reg             get_cmdFIFO_o;
    //reg             get_dataFIFO_o;
    reg             put_returnFIFO_o;
    reg     [ 2:0]  readPtr_ringBuff_o; 
    reg             listen_ringBuff_o;
    reg     [15:0]  dq_SSTL_o;
    reg     [ 1:0]  dm_SSTL_o;
    reg     [ 1:0]  dqs_i_SSTL_o;
    reg             ts_i_o; 
    reg             ri_i_o;
    reg     [24:0]  addr_returnFIFO_o;
    reg     [12:0]  a;
    
    // Internal reg
    reg             csbar, rasbar, casbar, webar;
    reg             csbarb, rasbarb, casbarb, webarb;
    reg     [24:0]  addr_cmdFIFO_reg;
    reg     [ 5:0]  cnt_reg;            // Generic state machine counter.
    reg     [11:0]  refCnt_reg;
    reg     [ 3:0]  blkCnt_reg;
    reg     [ 3:0]  state;              // Active state.
    reg     [ 1:0]  block_state;
    reg     [12:0]  row_address;        // Current row address.
    reg     [ 1:0]  bank_address;       // Current bank address.
    reg     [ 9:0]  column_address;     // Current column address.
    reg     [12:0]  rowb_address;        // Current row address.
    reg     [ 1:0]  bankb_address;       // Current bank address.
    reg     [ 9:0]  columnb_address;     // Current column address.
    reg     [ 2:0]  cmd_reg;
    reg     [ 1:0]  sz_reg;
    reg     [ 1:0]  szBlk_reg;
    reg     [ 1:0]  szRd_reg;
    reg             flag;
    reg             get_dataFIFO_p;
    reg             get_dataFIFO_n;
    
    wire    [12:0]  row_address_wire;        // Current row address.
    wire    [ 1:0]  bank_address_wire;       // Current bank address.
    wire    [ 9:0]  column_address_wire;     // Current column address.
    
    // Internal wires
    wire            cmdready;
   
    // Internal parameters
    localparam  [2:0]   NOP         =   3'b000, // Current command (from FIFO).
                        SCR         =   3'b001,
                        SCW         =   3'b010,
                        BLR         =   3'b011,
                        BLW         =   3'b100;

    localparam  [1:0]   B_IDLE      =   2'b00,
                        B_ACT       =   2'b01,
                        B_WRT       =   2'b10,
                        B_RD        =   2'b11;
                     
    localparam  [3:0]   IDLE        =   4'b0000, // States of the state machine.
                        GETCMD      =   4'b0001,
                        ACTIVATE    =   4'b0010,
                        // Read
                        SCREAD      =   4'b0011,
                        SCRLSN      =   4'b0100,
                        SCRNLSN     =   4'b0101,
                        SCRDNTH     =   4'b0110,
                        SCREND      =   4'b0111,
                        // Write
                        SCWRITE     =   4'b1000,
                        SCWRDATA    =   4'b1001,
                        SCWREND     =   4'b1010,
                        // Refresh
                        RPRE        =   4'b1011,
                        RNOP        =   4'b1100,
                        RREF        =   4'b1101,
                        RIDL        =   4'b1110;
    
    // Command for the SSTL (Uses csbar, casbar, webar and rasbar).
    localparam  [3:0]   CNOP        =   4'b0111,    // NOP.
                        CLM         =   4'b0000,    // MR and EMRs.
                        CREFRESH    =   4'b0001,    // Refresh and Auto Refresh.
                        CPRECHARGE  =   4'b0010,    // Precharge.
                        CACTIVATE   =   4'b0011,    // Activate.
                        CREAD       =   4'b0101,    // Read.
                        CWRITE      =   4'b0100;    // Write.
    
    assign row_address_wire     = (flag) ? rowb_address     : row_address;
    assign column_address_wire  = (flag) ? columnb_address  : column_address;
    assign bank_address_wire    = (flag) ? bankb_address    : bank_address;
    assign get_dataFIFO_o = get_dataFIFO_p | get_dataFIFO_n;
    assign cmdready = (emptyBar_cmdFIFO_i & ready_init_i) ? 1'b1 : 1'b0;   // Initialization is complete and input FIFOs are not empty.
    assign ba = bank_address_wire; // The current bank address.
    //assign a = ((state == SCREAD) || (state == SCWRITE) || (block_state == B_WRT) || (block_state == B_RD) || (state == RPRE)) ? {3'b001,column_address_wire} : row_address_wire; // Current address (Row or Column).
    assign casbar_o = (flag) ? casbarb  : casbar;
    assign csbar_o  = (flag) ? csbarb   : csbar;
    assign rasbar_o = (flag) ? rasbarb  : rasbar;
    assign webar_o  = (flag) ? webarb   : webar;
    
    /* Because of bank interleaving with continuous data input and output, the
     * address signal depends on multiple states. Making it combinational
     * violates the timing so this block is used and address is registered.
     */

    reg flag_a;
    always @ (posedge clk) begin
        if (reset) begin
            a   <=  13'b0;
            flag_a  <=  1'b0;
        end else begin
            a   <=   row_address_wire;
            if (flag_a) begin
                flag_a  <=  1'b0;
                a       <=  a;
            end else if (block_state == B_ACT && !blkCnt_reg) begin
                a   <=  {3'b001, column_address_wire};
                flag_a  <=  1'b1; 
            end else if (!cnt_reg) begin
                if (state == ACTIVATE) begin 
                    a   <=  {3'b001, column_address_wire};
                    flag_a  <=  1'b1;
                end 
                if (state == RPRE) begin 
                    a   <=  {3'b001, 10'b0};
                    flag_a  <=  1'b1;
                end
            end
        end
    end
    
    always @ (posedge clk) begin

        /* The counter to check if it is time to refresh */
        if (reset || !ready_init_i)
            refCnt_reg  <=  12'b1111_0011_1100;
        else
            refCnt_reg  <=  refCnt_reg - 1'b1;

        /* Flag is used to indicate if the subsequent commands of a burst read
         * or a burst write are currently active. If flag is zero, commands
         * would be idl. 
         */
        if(flag && block_state == B_IDLE && !blkCnt_reg && !szBlk_reg) begin
            flag    <=  1'b0;
        end
        if (flag && (block_state == B_RD || block_state == B_WRT) && !blkCnt_reg) begin
            addr_cmdFIFO_reg    <=  addr_cmdFIFO_reg + 4'b1000;
        end

        /* The signals commented here are reset in the parallel always block
         * which also updates them. This is required while synthesizing.
         */
        if(reset) begin
            state               <=  IDLE;
            //block_state         <=  B_IDLE;
            cnt_reg             <=  6'b0;
            //blkCnt_reg          <=  4'b0;
            put_returnFIFO_o    <=  1'b0;
            get_cmdFIFO_o       <=  1'b0;
            get_dataFIFO_p      <=  1'b0;
            //get_dataFIFO_n      <=  1'b0;
            listen_ringBuff_o   <=  1'b0;
            readPtr_ringBuff_o  <=  3'b0;
            addr_returnFIFO_o   <=  25'b0;
            addr_cmdFIFO_reg    <=  25'b0;
            row_address         <=  13'b0;
            bank_address        <=  2'b0;
            column_address      <=  10'b0;
            //rowb_address        <=  13'b0;
            //bankb_address       <=  2'b0;
            //columnb_address     <=  10'b0;
            flag                <=  1'b0;
            cmd_reg             <=  3'b0;
            sz_reg              <=  2'b0;
            //szBlk_reg           <=  2'b0;
            szRd_reg            <=  2'b0;
            {csbar, rasbar, casbar, webar}      <=  CNOP;
            //{csbarb, rasbarb, casbarb, webarb}  <=  CNOP;
        end else begin
            case(state)
                /* The idle state, if the command fifo is not empty, a get
                 * command signal is given and state changes. If the refresh
                 * counter has reached threshold, refresh logic is called.
                 */
                IDLE: begin // 4'b0000
                    if (ready_init_i && refCnt_reg < 12'b0000_0110_0100) begin
                        state               <=  RPRE;
                        if (CK) begin
                            {csbar, rasbar, casbar, webar}  <=  CPRECHARGE;
                            cnt_reg         <=  6'b00_0001;
                        end else begin
                            {csbar, rasbar, casbar, webar}  <=  CNOP;
                            cnt_reg         <=  6'b00_0010;
                        end
                    end else if(!cnt_reg) begin
                        if(cmdready) begin
                            state               <=  GETCMD;
                            cnt_reg             <=  6'b00_0010;
                            get_cmdFIFO_o       <=  1'b1;
                            readPtr_ringBuff_o  <=  3'b111;
							flag				<=	1'b0;
                        end else begin
                            state               <=  IDLE;
                            cnt_reg             <=  6'b00;
                            get_cmdFIFO_o       <=  1'b0;
                        end
                    end else begin
                        state       <=  IDLE;
                        cnt_reg     <=  cnt_reg - 1'b1;
                        {csbar, rasbar, casbar, webar}  <=  CNOP;
                    end
                end
                
                // Precharge all banks (for refresh).
                RPRE: begin
                    if (!cnt_reg) begin
                        state       <=  RNOP;
                        cnt_reg     <=  6'b00_0111;
                        {csbar, rasbar, casbar, webar}  <=  CNOP;
                    end else begin
                        state       <=  RPRE;
                        cnt_reg     <=  cnt_reg - 1'b1;
                        {csbar, rasbar, casbar, webar}  <=  CPRECHARGE;
                    end
                end
                
                // Wait after precharge (for refresh).
                RNOP: begin
                    if (!cnt_reg) begin
                        state       <=  RREF;
                        cnt_reg     <=  6'b00_0001;
                        {csbar, rasbar, casbar, webar}  <=  CREFRESH;
                        // To confirm if the prechareg signal is indeed given.
                        // Can be used to check the time between 2 refresh
                        // commands. Not used while synthesizing (since it is
                        // ignored anyway).
                        //
                        // $display ("Applying Refresh at %t ns", $time);
                    end else begin
                        state       <=  RNOP;
                        cnt_reg     <=  cnt_reg - 1'b1;
                        {csbar, rasbar, casbar, webar}  <=  CNOP;
                    end
                end
                
                // Give the refresh command.
                RREF: begin
                    if (!cnt_reg) begin
                        state       <=  RIDL;
                        cnt_reg     <=  6'b11_0111;
                        refCnt_reg  <=  12'b1111_0011_1100;
                        {csbar, rasbar, casbar, webar}  <=  CNOP;
                    end else begin
                        state       <=  RREF;
                        cnt_reg     <=  cnt_reg - 1'b1;
                        {csbar, rasbar, casbar, webar}  <=  CREFRESH;
                    end
                end
                
                // Wait before next activate can be given.
                RIDL: begin
                    if (!cnt_reg) begin
                        state       <=  IDLE;
                        cnt_reg     <=  6'b00_0001;
                        {csbar, rasbar, casbar, webar}  <=  CNOP;
                    end else begin
                        state       <=  RIDL;
                        cnt_reg     <=  cnt_reg - 1'b1;
                        {csbar, rasbar, casbar, webar}  <=  CNOP;
                    end
                end

                // If ready is active and command fifo has commands, get the
                // command.
                GETCMD: begin // 4'b0001
                        if(!cnt_reg) begin
                            //if ((cmd_cmdFIFO_i == SCR) || (cmd_cmdFIFO_i == SCW) || (cmd_cmdFIFO_i == BLR) || (cmd_cmdFIFO_i == BLW)) begin
                                state               <=  ACTIVATE;   // For scalar read or write command, go to activate.
                                addr_cmdFIFO_reg    <=  addr_cmdFIFO_i;
                                addr_returnFIFO_o   <=  addr_cmdFIFO_i;
                                cmd_reg             <=  cmd_cmdFIFO_i;
                                sz_reg              <=  sz_cmdFIFO_i;
                                //szBlk_reg           <=  sz_cmdFIFO_i;
                                szRd_reg            <=  sz_cmdFIFO_i;
                                //row_address         <=  addr_cmdFIFO_i[24:12];
                                //column_address      <=  {addr_cmdFIFO_i[11: 5], addr_cmdFIFO_i[2:0]};
                                //bank_address        <=  addr_cmdFIFO_i[4:3];
                                if (CK) begin
                                    {csbar, rasbar, casbar, webar}  <=  CACTIVATE;
                                    cnt_reg         <=  6'b00_0001;
                                end else begin
                                    {csbar, rasbar, casbar, webar}  <=  CNOP;
                                    cnt_reg         <=  6'b00_0010;
                                end
                            /*end else begin
                                state           <=  IDLE;
                                cnt_reg         <=  6'b00;
                                row_address     <=  13'b0;
                                bank_address    <=  2'b0;
                                column_address  <=  10'b0;
                                {csbar, rasbar, casbar, webar}  <=  CNOP;
                            end */
                        end else begin
                            state           <= GETCMD;
                            cnt_reg         <=  cnt_reg - 1'b1;
                            get_cmdFIFO_o   <=  1'b0;
                            {csbar, rasbar, casbar, webar}  <=  CNOP;
                        end
                        if (cnt_reg == 6'b00_0001) begin
                            row_address         <=  addr_cmdFIFO_i[24:12];
                            column_address      <=  {addr_cmdFIFO_i[11: 5], addr_cmdFIFO_i[2:0]};
                            bank_address        <=  addr_cmdFIFO_i[4:3];
                        end
                        /*if (cnt_reg == 6'b00_0010) begin
                            put_returnFIFO_o    <= 1'b0;
                        end*/
                end
                
                // If the command is valid (which is always the case here
                // since the command fifo never has invalid commands) then
                // give the activate command.
                ACTIVATE: begin // 4'b0010
                    if(!cnt_reg) begin
                        case(cmd_reg)
                            SCR: begin
                                state           <=  SCREAD;
                                cnt_reg         <=  6'b00_0001;
				                //get_dataFIFO_o  <=  1'b1;
                                {csbar, rasbar, casbar, webar}  <=  CREAD;
                                //row_address will be latched from what was in getcmd
                                //bank_address will be latched from what was in getcmd
                                        
                            end

                            SCW: begin
                                state           <=  SCWRITE;
                                cnt_reg         <=  6'b00_0001;
				                get_dataFIFO_p  <=  1'b1;
                                {csbar, rasbar, casbar, webar}  <=  CWRITE;
                                //row_address will be latched from what was in getcmd
                                //bank_address will be latched from what was in getcmd
                            end

                            BLR: begin
                                // Before a block read, make sure that the
                                // return FIFO has enough space to accommodate
                                // the data (which is redundant since the
                                // testbench always reads the return fifo and
                                // the comparison will always be true).
                                state   <=  ACTIVATE;
                                cnt_reg <=  6'b00_0000;
				                //get_dataFIFO_o  <=  1'b1;
                                {csbar, rasbar, casbar, webar}  <=  CNOP;
                                case (sz_reg)
                                    2'b00: begin
                                        if (fillcount_returnFIFO_i < 6'b11_1000) begin
                                            state   <=  SCREAD;
                                            cnt_reg <=  6'b00_0001;
                                            {csbar, rasbar, casbar, webar}  <=  CREAD;
                                        end
                                    end
                                    
                                    2'b01: begin
                                        if (fillcount_returnFIFO_i < 6'b11_0000) begin
                                            state   <=  SCREAD;
                                            cnt_reg <=  6'b00_0001;
                                            {csbar, rasbar, casbar, webar}  <=  CREAD;
                                        end
                                    end
                                    
                                    2'b10: begin
                                        if (fillcount_returnFIFO_i < 6'b10_1000) begin
                                            state   <=  SCREAD;
                                            cnt_reg <=  6'b00_0001;
                                            {csbar, rasbar, casbar, webar}  <=  CREAD;
                                        end
                                    end
                                    
                                    2'b11: begin
                                        if (fillcount_returnFIFO_i < 6'b10_0000) begin
                                            state   <=  SCREAD;
                                            cnt_reg <=  6'b00_0001;
                                            {csbar, rasbar, casbar, webar}  <=  CREAD;
                                        end
                                    end
                                    
                                    default: begin
                                        state   <=  ACTIVATE;
                                        cnt_reg <=  6'b00_0001;
                                        {csbar, rasbar, casbar, webar}  <=  CACTIVATE;
                                    end
                                endcase
                            end

                            BLW: begin
                                state           <=  SCWRITE;
                                cnt_reg         <=  6'b00_0001;
				                get_dataFIFO_p  <=  1'b1;
                                {csbar, rasbar, casbar, webar}  <=  CWRITE;
                            end

                            default: begin
                                state   <=  IDLE;
                                cnt_reg <=  6'b00_0000;
                                {csbar, rasbar, casbar, webar}  <=  CNOP;
                            end
                        endcase
                    end else begin
                        state   <=  ACTIVATE;
                        cnt_reg <=  cnt_reg - 1'b1;
                        {csbar, rasbar, casbar, webar}  <=  CACTIVATE;
                    end
                end

                // Wait for read latency.
                SCREAD: begin // 4'b0011
                    if(!cnt_reg) begin
                        state       <=  SCRLSN;
                        cnt_reg     <=  (2 * (AL + CL - 1'b1) - 1'b1);
                        if (!flag) begin
                            {csbar, rasbar, casbar, webar}  <=  CNOP;
                        end
                        if (!(!sz_reg) && cmd_reg == BLR) begin
                            addr_cmdFIFO_reg    <=  addr_cmdFIFO_reg + 4'b1000;
                            flag                <=  1'b1;
                        end else begin
                            flag                <=  1'b0;
						end
                    end else begin
                        state       <=  SCREAD;
                        cnt_reg     <=  cnt_reg - 1'b1;
                        get_dataFIFO_p  <=  1'b0;
                        if (!flag) begin
                            {csbar, rasbar, casbar, webar}  <=  CREAD;
                        end
                    end
                end

                // Issue the listen command to the ring buffer.
                SCRLSN: begin // 4'b0100
                    if(!cnt_reg) begin
                        if (fullBar_returnFIFO_i) begin
                            state               <=  SCRNLSN;
                            cnt_reg             <=  6'b00_0000;
                            if ((sz_reg == szRd_reg) || cmd_reg == SCR)
                                listen_ringBuff_o   <=  1'b1;
                            if (!flag) begin
                                {csbar, rasbar, casbar, webar}  <=  CNOP;
                            end
                        end
                    end else begin
                        state                   <=  SCRLSN;
                        cnt_reg                 <=  cnt_reg - 1'b1;
                        listen_ringBuff_o       <=  1'b0;
                        if (!flag) begin
                            {csbar, rasbar, casbar, webar}  <=  CNOP;
                        end
                    end
                    
                    if (cmd_reg != SCR) begin
                        readPtr_ringBuff_o	<= readPtr_ringBuff_o + 1'b1;
                        addr_returnFIFO_o   <= addr_returnFIFO_o + 1'b1;
                    end else
                        readPtr_ringBuff_o  <= 3'b0;
                end
                
                // Remove the listen command. Here, the tricky part is, the
                // delay between the first 2 listen pulses for contiguous data
                // is 9 clock cycles and after that it's 8 clock cycles. Hence
                // we had to add two states to take care of that depending on
                // the current cycle of the burst.
                SCRNLSN: begin // 4'b0101
                    state               <=  SCRDNTH;
                    cnt_reg             <=  6'b00_0101;
                    if (cmd_reg != SCR) begin
                        readPtr_ringBuff_o	<= readPtr_ringBuff_o + 1'b1;
                        addr_returnFIFO_o   <= addr_returnFIFO_o + 1'b1;
                    end else
                        readPtr_ringBuff_o  <= 3'b0;
                    if ((sz_reg == szRd_reg) && cmd_reg == BLR) begin
                        listen_ringBuff_o   <=  1'b0;
                    end else
                        listen_ringBuff_o   <=  1'b1;
                    
                    if (!flag) begin
                        {csbar, rasbar, casbar, webar}  <=  CNOP;
                    end
                end

                // Do nothing, wait till the ring buffer reads the data from
                // the DDR2 memory. Then check if this was the last burst, if
                // it was, end else go back and give listen command for the
                // next 8 data words.
                SCRDNTH: begin // 4'b0110;
                    if(!cnt_reg) begin
                        if (cmd_reg == SCR || !szRd_reg) begin
                            state               <=  SCREND;
                            cnt_reg             <=  6'b00_0011;
                            put_returnFIFO_o    <=  1'b1;
                        end else begin
                            state               <=  SCRLSN;
                            cnt_reg             <=  6'b00_0000;
                            szRd_reg            <=  szRd_reg - 1'b1;
                        end
                        if (!flag) begin
                            {csbar, rasbar, casbar, webar}  <=  CNOP;
                        end
                    end else begin
                        state               <=  SCRDNTH;
                        cnt_reg             <=  cnt_reg - 1'b1;
                        listen_ringBuff_o   <=  1'b0;
                        if (!flag) begin
                            {csbar, rasbar, casbar, webar}  <=  CNOP;
                        end
                    end

                    if (cmd_reg != SCR) begin
                        readPtr_ringBuff_o	<=  readPtr_ringBuff_o + 1'b1;
                        addr_returnFIFO_o   <=  addr_returnFIFO_o + 1'b1;
                    end else begin
                        readPtr_ringBuff_o  <=  3'b0;
                    end
                    
                    if (cmd_reg == BLR && cnt_reg == 6'b00_0100 && (sz_reg == szRd_reg)) begin
                        readPtr_ringBuff_o  <=  3'b0;
                        put_returnFIFO_o    <=  1'b1;
                        addr_returnFIFO_o   <=  addr_cmdFIFO_i;
                    end

                end

                // Do nothing, just wait for some cycles (mainly used to
                // properly align the put return fifo signal. Not required but
                // that increases the combinational delay on the put signal.
                SCREND: begin // 4'b0111
                    if(!cnt_reg) begin
                        state               <=  IDLE;
                        /*if (sz_reg == 2'b00 || 2'b10)
                            cnt_reg             <=  6'b00_0001;
                        else
                            cnt_reg             <=  6'b00_0001;
                        */
                        //if (cmd_reg == SCR)   
                            put_returnFIFO_o    <=  1'b0;
                        //else
                            //put_returnFIFO_o    <=  1'b1;
                        if (!flag) begin
                            {csbar, rasbar, casbar, webar}  <=  CNOP;
                        end
                    end else begin 
                        state               <=  SCREND;
                        cnt_reg             <=  cnt_reg - 1'b1;
                        if (!flag) begin
                            {csbar, rasbar, casbar, webar}  <=  CNOP;
                        end
                    end
                    
                    if (cmd_reg != SCR) begin
                        readPtr_ringBuff_o	<= readPtr_ringBuff_o + 1'b1;
                        addr_returnFIFO_o   <= addr_returnFIFO_o + 1'b1;
                    end else begin
                        readPtr_ringBuff_o  <= 3'b0;
                        put_returnFIFO_o    <= 1'b0;
                    end
                end

                // Wait for the write latency time.
                SCWRITE: begin // 4'b0111
                    if(!cnt_reg) begin
                        state               <=  SCWRDATA;
                        cnt_reg             <=  (2*(AL + CL - 1'b1) - 2'b10);
                        if (!flag) begin
                            {csbar, rasbar, casbar, webar}  <=  CNOP;
                        end
                        if (!(!sz_reg) && cmd_reg == BLW) begin
                            addr_cmdFIFO_reg    <=  addr_cmdFIFO_reg + 4'b1000;
                            flag                <=  1'b1;
                            //blkCnt_reg          <=  4'b0011;
                        end else begin
                            flag                <=  1'b0;
						end
                    end else begin
                        state               <= SCWRITE;
                        cnt_reg             <=  cnt_reg - 1'b1;
			            get_dataFIFO_p      <=  1'b0;
                        if (!flag) begin
                            {csbar, rasbar, casbar, webar}  <=  CWRITE;
                        end
                    end
                end
                
                // Depending on the number of data words to write, pick proper
                // count value and then go to next state where the DQS will be
                // generated. 
                SCWRDATA: begin // 4'b1001
                    if(!cnt_reg) begin
                        state               <=  SCWREND;
                        if (cmd_reg == BLW) begin
                            case (sz_reg)
                                2'b00: begin
                                    cnt_reg             <=  6'b00_0111;
                                end

                                2'b01: begin
                                    cnt_reg             <=  6'b00_1111;
                                end

                                2'b10: begin
                                    cnt_reg             <=  6'b01_0111;
                                end

                                2'b11: begin
                                    cnt_reg             <=  6'b01_1111;
                                end

                                default: begin
                                    cnt_reg             <=  6'b00_0111;
                                end
                            endcase
                        end else begin
                            cnt_reg             <=  6'b00_0111;
                        end
                        if (!flag) begin
                            {csbar, rasbar, casbar, webar}  <=  CNOP;
                        end
                    end else begin
                        state               <= SCWRDATA;
                        cnt_reg             <=  cnt_reg - 1'b1;
                        if (!flag) begin
                            {csbar, rasbar, casbar, webar}  <=  CNOP;
                        end
                    end
                end
                
                // DQS is generated in this state (in a separate always block
                // that runs on negative edge of clock.
                SCWREND: begin // 4'b1010
                    if(!cnt_reg) begin
                        state               <=  IDLE;
                        cnt_reg             <=  6'b01_0001;
                        if (!flag) begin
                            {csbar, rasbar, casbar, webar}  <=  CNOP;
                        end
                    end else begin
                        state               <=  SCWREND;
                        cnt_reg             <=  cnt_reg - 1'b1;
                        if (!flag) begin
                            {csbar, rasbar, casbar, webar}  <=  CNOP;
                        end
                    end
                end

                default: begin
                end

            endcase
        end
    end

    // Used to generate the DM signal to be given to the DDR2 memory while
    // writing data to it. It is a data mask which needs to be 00
    // for a valid data input and 2'b11 (3) for invalid data.
    always @(negedge clk) begin
        //if (reset)
            //get_dataFIFO_n  <=  1'b0;
        if (((state == SCWRDATA) && (!cnt_reg)) || ((cmd_reg == BLW) && (state == SCWREND) && (cnt_reg != 6'b0))) begin
            dq_SSTL_o       <=  din_dataFIFO_i;
            dm_SSTL_o       <=  2'b00;
            //get_dataFIFO_n  <=  1'b1;
            //get_cmdFIFO_o   <=  1'b1;
            //if ((state==SCWREND)&&(cnt_reg < 6'b00_0010 ) || (cmd_reg == SCW)) begin
                //get_dataFIFO_n  <=  1'b0;
                //get_cmdFIFO_o   <=  1'b0;
            //end
        end else begin
            dm_SSTL_o       <=  2'b11;
            dq_SSTL_o       <=  16'b0;
        end
    end
    
    // This is the get data fifo signal. It will control when the data is
    // fetched from the input data fifo to be written to the DDR2 memory.
    always @(posedge clk) begin
        if (reset)
            get_dataFIFO_n  <=  1'b0;
        if (((state == SCWRDATA) && (cnt_reg == 6'b00_0001)) || ((cmd_reg == BLW) && (state == SCWREND) && !(!cnt_reg))) begin
            get_dataFIFO_n  <=  1'b1;
            if ((state==SCWREND)&&(cnt_reg < 6'b00_0011 ) || (cmd_reg == SCW)) begin
                get_dataFIFO_n  <=  1'b0;
            end
        end
    end

    // This is the TS and RI signal controller block. Proper values while
    // reading and writing are maintained. It also generates the DQS signal
    // which makes a transition on every clock edge and DDR2 memory writes the
    // data input when there is a transition on DQS.
    always @(posedge clk) begin
        if ((state == SCWRDATA) && (cnt_reg == 6'b00_0011)) begin
            dqs_i_SSTL_o    <=  2'b0;
            ts_i_o          <=  1'b1;
            ri_i_o          <=  1'b0;

        end else if (state == SCWREND && cnt_reg == 6'b00) begin
            ts_i_o          <=  1'b0;
            ri_i_o          <=  1'b1;
        end
            
        if (((state == SCWRDATA) && (!cnt_reg)) || ((state == SCWREND) && !(!cnt_reg))) begin
            dqs_i_SSTL_o <=  ~dqs_i_SSTL_o;
        end
    end
    
    // This always block controls the entire command sequence for the block
    // read and write commands where the commands are given when the
    // controller is readin or writing from/to the RAM.
    always @(posedge clk) begin
        if (state == GETCMD && !cnt_reg)
            szBlk_reg           <=  sz_cmdFIFO_i;
        if (state == SCREAD && !cnt_reg && !(!sz_reg))
            blkCnt_reg          <=  4'b0011;
        if (state == SCWRITE && !cnt_reg && !(!sz_reg))
            blkCnt_reg          <=  4'b0011;

        if(reset) begin
            //state               <=  IDLE;
            block_state         <=  B_IDLE;
            //cnt_reg             <=  6'b0;
            blkCnt_reg          <=  4'b0;
            //put_returnFIFO_o    <=  1'b0;
            //get_cmdFIFO_o       <=  1'b0;
            //get_dataFIFO_p      <=  1'b0;
            //get_dataFIFO_n      <=  1'b0;
            //listen_ringBuff_o   <=  1'b0;
            //readPtr_ringBuff_o  <=  3'b0;
            //addr_returnFIFO_o   <=  25'b0;
            //addr_cmdFIFO_reg    <=  25'b0;
            //row_address         <=  13'b0;
            //bank_address        <=  2'b0;
            //column_address      <=  10'b0;
            rowb_address        <=  13'b0;
            bankb_address       <=  2'b0;
            columnb_address     <=  10'b0;
            //flag                <=  1'b0;
            //cmd_reg             <=  3'b0;
            //sz_reg              <=  2'b0;
            szBlk_reg           <=  2'b0;
            //szRd_reg            <=  2'b0;
            //{csbar, rasbar, casbar, webar}      <=  CNOP;
            {csbarb, rasbarb, casbarb, webarb}  <=  CNOP;
        end else if(flag) begin
            case (block_state)
                B_IDLE: begin
                    if (!blkCnt_reg) begin
                        if (!szBlk_reg) begin
                            //flag        <=  1'b0;
                            block_state <=  B_IDLE;
                            {csbarb, rasbarb, casbarb, webarb}  <=  CNOP;
                        end else begin
                            block_state         <=  B_ACT;
                            blkCnt_reg          <=  4'b0001;
                            {csbarb, rasbarb, casbarb, webarb}  <=  CACTIVATE;
                        end
                    end else begin
                        block_state <=  B_IDLE;
                        blkCnt_reg  <=  blkCnt_reg - 1'b1;
                        {csbarb, rasbarb, casbarb, webarb}  <=  CNOP;
                    end
                    if (blkCnt_reg == 4'b0001) begin
                        rowb_address        <=  addr_cmdFIFO_reg[24:12];
                        columnb_address     <=  {addr_cmdFIFO_reg[11: 5], addr_cmdFIFO_reg[2:0]};
                        bankb_address       <=  addr_cmdFIFO_reg[4:3];
                    end
                end

                B_ACT: begin
                    if (!blkCnt_reg) begin
                        //block_state <=  B_WRT;
                        blkCnt_reg  <=  4'b0001;
                        if(cmd_reg == BLW) begin
                            {csbarb, rasbarb, casbarb, webarb}  <=  CWRITE;
                            block_state <=  B_WRT;
                        end else if(cmd_reg == BLR) begin
                            {csbarb, rasbarb, casbarb, webarb}  <=  CREAD;
                            block_state <=  B_RD;
                        end else begin
                            {csbarb, rasbarb, casbarb, webarb}  <=  CNOP;  
                        end
                    end else begin
                        block_state <=  B_ACT;
                        blkCnt_reg  <=  blkCnt_reg - 1'b1;
                        {csbarb, rasbarb, casbarb, webarb}  <=  CACTIVATE;
                    end
                end

                B_WRT: begin
                    if (!blkCnt_reg) begin
                        block_state         <=  B_IDLE;
                        blkCnt_reg          <=  4'b0011;
                        szBlk_reg           <=  szBlk_reg - 1'b1;
                        //addr_cmdFIFO_reg    <=  addr_cmdFIFO_reg + 4'b1000;
                        {csbarb, rasbarb, casbarb, webarb}  <=  CNOP;
                    end else begin
                        block_state <=  B_WRT;
                        blkCnt_reg  <=  blkCnt_reg - 1'b1;
                        {csbarb, rasbarb, casbarb, webarb}  <=  CWRITE;
                    end
                end

                B_RD: begin
                    if (!blkCnt_reg) begin
                        block_state         <=  B_IDLE;
                        blkCnt_reg          <=  4'b0011;
                        szBlk_reg           <=  szBlk_reg - 1'b1;
                        //addr_cmdFIFO_reg    <=  addr_cmdFIFO_reg + 4'b1000;
                        {csbarb, rasbarb, casbarb, webarb}  <=  CNOP;
                    end else begin
                        block_state <=  B_RD;
                        blkCnt_reg  <=  blkCnt_reg - 1'b1;
                        {csbarb, rasbarb, casbarb, webarb}  <=  CREAD;
                    end
                end

                default: begin
                end
            endcase
        end
    end
                    
endmodule

