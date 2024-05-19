// This program was cloned from: https://github.com/lvzhengde/tsn-soc
// License: BSD 3-Clause "New" or "Revised" License

/*+
 * Copyright (c) 2022-2024 Zhengde
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
 * JTAG Debug Module
 * Only one hart supported
 * Only support abstract command debugging
 * Not support system bus and program buffer
-*/

module jtag_dm
//-----------------------------------------------------------------
// Params
//-----------------------------------------------------------------
#(
    parameter DMI_ADDR_W         = 7,
    parameter MEM_CACHE_ADDR_MIN = 32'h80000000 ,
    parameter MEM_CACHE_ADDR_MAX = 32'h8fffffff 
)
//-----------------------------------------------------------------
// Ports
//-----------------------------------------------------------------
(
    //Inputs
    input                    clk            ,
    input                    rst_n          ,
    input  [ 31:0]           cpu_id_i       ,

    // DMI interface
    output                   dm_resp_o      ,
    output [DMI_ADDR_W+33:0] dm_resp_data_o ,
    input                    dtm_ack_i      ,

    output                   dm_ack_o       ,
    input                    dtm_req_i      ,
    input  [DMI_ADDR_W+33:0] dtm_req_data_i ,

    //JTAG control outputs
    output                   reset_hart_o   ,
    output                   halt_hart_o    ,
    output                   bus_req_o      ,

    //JTAG GPR access interface
    output [  4:0]           gpr_waddr_o    ,
    output [ 31:0]           gpr_data_wr_o  ,
    output [  4:0]           gpr_raddr_o    ,
    input  [ 31:0]           gpr_data_rd_i  ,

    //JTAG CSR access interface
    output                   csr_write_o    ,
    output [ 11:0]           csr_waddr_o    ,
    output [ 31:0]           csr_data_wr_o  ,
    output [ 11:0]           csr_raddr_o    ,
    input  [ 31:0]           csr_data_rd_i  ,

    //JTAG memory access interface
    //Inputs
    input  [ 31:0]           mem_d_data_rd_i    ,
    input                    mem_d_accept_i     ,
    input                    mem_d_ack_i        ,
    input                    mem_d_error_i      ,
    input  [ 10:0]           mem_d_resp_tag_i   ,
    input                    mem_load_fault_i   ,
    input                    mem_store_fault_i  ,

    //Outputs
    output [ 31:0]           mem_d_addr_o       ,
    output [ 31:0]           mem_d_data_wr_o    ,
    output                   mem_d_rd_o         ,
    output [  3:0]           mem_d_wr_o         ,
    output                   mem_d_cacheable_o  ,
    output [ 10:0]           mem_d_req_tag_o    ,
    output                   mem_d_invalidate_o ,
    output                   mem_d_writeback_o  ,
    output                   mem_d_flush_o       

);

    //--------------------------------------------
    // local parameters
    //--------------------------------------------
    localparam DTM_OP_NOP   = 2'b00;
    localparam DTM_OP_READ  = 2'b01;
    localparam DTM_OP_WRITE = 2'b10;
    localparam OP_SUCCESS   = 2'b00;
    localparam OP_FAIL      = 2'b10;

    //DM register address
    localparam DMSTATUS_A      = 7'h11;
    localparam DMCONTROL_A     = 7'h10;
    localparam DMCONTROL_MASK  = 32'h20010003;
    localparam ABSTRACTCS_A    = 7'h16;
    localparam DATA0_A         = 7'h04;
    localparam DATA1_A         = 7'h05;
    localparam COMMAND_A       = 7'h17;

    //-------------------------------------
    // Registers / Wires
    // ------------------------------------
    wire  [31:0]            dmstatus_w ;
    reg   [31:0]            dmcontrol_q;
    reg   [31:0]            command_q;
    wire  [31:0]            abstractcs_w;
    reg   [31:0]            data0_q;
    reg   [31:0]            data1_q;

    wire  [ 1:0]            op_w  ;
    wire  [31:0]            data_w;
    wire  [DMI_ADDR_W-1:0]  addr_w;


    //-------------------------------------
    // DTM Request / DM Ack --register access
    // ------------------------------------
    reg                     dtm_req_d1, dtm_req_d2;
    reg   [DMI_ADDR_W+33:0] dtm_req_data_q;
    wire                    dm_ack_w;
    reg                     dm_ack_q;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            {dtm_req_d1, dtm_req_d2} <= 2'b0;
        else
            {dtm_req_d1, dtm_req_d2} <= {dtm_req_i, dtm_req_d1};
    end    

    assign dm_ack_w = (dtm_req_d2 == 1'b1) ? 1'b1 : 1'b0;

    always @(posedge clk) begin
        dm_ack_q <= dm_ack_w;
    end    

    wire dm_ack_pul_w = dm_ack_w & (!dm_ack_q);
    reg  dm_ack_pul_q;

    always @(posedge clk) begin
        dm_ack_pul_q <= dm_ack_pul_w;
    end    

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            dtm_req_data_q <= {(DMI_ADDR_W+34){1'b0}};
        else if(dm_ack_pul_w)
            dtm_req_data_q <= dtm_req_data_i;
    end    

    wire  [DMI_ADDR_W+33:0] dtm_req_data_w = dm_ack_pul_w ? dtm_req_data_i : dtm_req_data_q;
    
    assign op_w   = dtm_req_data_w[1:0];
    assign data_w = dtm_req_data_w[33:2];
    assign addr_w = dtm_req_data_w[DMI_ADDR_W+33:34];

    assign dm_ack_o = dm_ack_q;

    //-------------------------------------
    // DM control register
    // ------------------------------------
    reg  haltreq_q;
    reg  resumereq_q;
    reg  ackhavereset_q;

    wire hartreset_w       = dmcontrol_q[29];
    wire ndmreset_w        = dmcontrol_q[1];
    wire dmactive_w        = dmcontrol_q[0] ;

    wire dmcontrol_wrsel_w = (op_w == DTM_OP_WRITE && addr_w == DMCONTROL_A && dm_ack_pul_q == 1'b1);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            dmcontrol_q    <= 32'h1;
            haltreq_q      <= 1'b0;
            resumereq_q    <= 1'b0;
            ackhavereset_q <= 1'b0;
        end
        else if(dmcontrol_wrsel_w) begin
            if (dmactive_w) begin
                dmcontrol_q    <= data_w & DMCONTROL_MASK;
                haltreq_q      <= data_w[31];
                ackhavereset_q <= data_w[28];

                if (data_w[30] & (!data_w[31]) & (!haltreq_q)) 
                    resumereq_q <= 1'b1;
            end
            else begin
                //per spec, the dmactive bit is the only bit which can 
                //be written to something other than its reset value 
                //when dmactive bit is set to 0
                dmcontrol_q[0]     <= data_w[0];
            end
        end
        else if(!dmactive_w) begin  //reset DM
            dmcontrol_q    <= 32'h0;
            haltreq_q      <= 1'b0;
            resumereq_q    <= 1'b0;
            ackhavereset_q <= 1'b0;
        end
        else begin  //clear pulse signals
            resumereq_q    <= 1'b0;
            ackhavereset_q <= 1'b0;
        end
    end    

    //-------------------------------------
    // DM status register
    // ------------------------------------
    reg   hart_halted_q;
    reg   hart_halted_d1;
    reg   resumeack_q;
    reg   havereset_q;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            hart_halted_q <= 1'b0;
            resumeack_q   <= 1'b1;
        end
        else if(!dmactive_w) begin   //reset DM
            hart_halted_q <= 1'b0;
            resumeack_q   <= 1'b1;
        end
        else if (haltreq_q) begin
            hart_halted_q <= 1'b1;
        end
        else if(resumereq_q) begin
            hart_halted_q <= 1'b0;
            resumeack_q   <= 1'b0;
        end
        else if (hart_halted_d1 & (!hart_halted_q)) begin
            resumeack_q   <= 1'b1;
        end
    end

    always @(posedge clk) begin
        hart_halted_d1 <= hart_halted_q;
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) 
            havereset_q <= 1'b1;
        else if(!dmactive_w)   //reset DM
            havereset_q <= 1'b1;
        else if (ackhavereset_q)
            havereset_q <= 1'b0;
    end

    assign dmstatus_w[31:20] = 12'h4;
    assign dmstatus_w[15:12] = 4'h0;
    assign dmstatus_w[7:0]   = 8'h82;
    assign dmstatus_w[19:18] = {havereset_q, havereset_q};
    assign dmstatus_w[17:16] = {resumeack_q, resumeack_q};
    assign dmstatus_w[11:10] = {~hart_halted_q, ~hart_halted_q};
    assign dmstatus_w[9:8]   = {hart_halted_q, hart_halted_q};

    assign reset_hart_o = hartreset_w | ndmreset_w;
    assign halt_hart_o  = hart_halted_q ;

    //-----------------------------------------
    // DM Abstract Command (command) register
    // ++
    // DM Abstract Control and Status register
    // ----------------------------------------
    reg          busy_q;
    reg  [ 2:0]  cmderr_q;
    reg          issue_command_q;
    reg          is_mem_access_q;

    wire         command_wrsel_w = (op_w == DTM_OP_WRITE && addr_w == COMMAND_A && dm_ack_pul_q == 1'b1);
    wire [31:0]  command_w = (command_wrsel_w) ? data_w : command_q;
    wire [ 7:0]  cmdtype_w = command_w[31:24];
    wire [23:0]  control_w = command_w[23:0];

    wire         write_w    = control_w[16];

    //for abstract register access
    wire [ 2:0]  aarsize_w  = control_w[22:20];
    wire         aarpostincrement_w = control_w[19];
    wire         postexec_w = control_w[18];
    wire         transfer_w = control_w[17];
    wire [15:0]  regno_w    = control_w[15:0];

    //for absctract memory access
    wire         aamvirtual_w = control_w[23];
    wire [ 2:0]  aamsize_w    = control_w[22:20];
    wire         aampostincrement_w = control_w[19];
    wire [ 1:0]  target_specific_w  = control_w[15:14];
    
    wire abstractcs_wrsel_w = (op_w == DTM_OP_WRITE && addr_w == ABSTRACTCS_A && dm_ack_pul_q == 1'b1);
    wire data0_wrsel_w      = (op_w == DTM_OP_WRITE && addr_w == DATA0_A && dm_ack_pul_q == 1'b1);
    wire data1_wrsel_w      = (op_w == DTM_OP_WRITE && addr_w == DATA1_A && dm_ack_pul_q == 1'b1);
    wire data0_rdsel_w      = (op_w == DTM_OP_READ && addr_w == DATA0_A && dm_ack_pul_q == 1'b1);
    wire data1_rdsel_w      = (op_w == DTM_OP_READ && addr_w == DATA1_A && dm_ack_pul_q == 1'b1);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) 
            busy_q <= 1'b0;
        else if(!dmactive_w)    //reset DM
            busy_q <= 1'b0; 
        else if (issue_command_q) 
            busy_q <= 1'b1;
        //command completed to release busy
        //non-memory access command completed immediately
        else if (cmdtype_w != 8'h2)
            busy_q <= 1'b0;
        else if (is_mem_access_q && mem_wb_valid) 
            busy_q <= 1'b0;
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin 
            cmderr_q        <= 3'h0;
            issue_command_q <= 1'b0;
            command_q       <= 32'h0;
            is_mem_access_q <= 1'b0;
        end 
        else if(!dmactive_w) begin   //reset DM
            cmderr_q        <= 3'h0; 
            issue_command_q <= 1'b0;
            command_q       <= 32'h0;
            is_mem_access_q <= 1'b0;
        end
        else if ((cmderr_q == 3'h0) && busy_q && (abstractcs_wrsel_w | command_wrsel_w)) begin 
            cmderr_q        <= 3'h1; 
            issue_command_q <= 1'b0;
            is_mem_access_q <= 1'b0;
        end
        else if ((cmderr_q == 3'h0) && busy_q && (data0_wrsel_w | data1_wrsel_w | data0_rdsel_w | data1_rdsel_w )) begin
            cmderr_q        <= 3'h1; 
            issue_command_q <= 1'b0;
            is_mem_access_q <= 1'b0;
        end
        else if (abstractcs_wrsel_w) begin //write 1 to clear
            cmderr_q[0]     <= data_w[ 8] ? 0 : cmderr_q[0];
            cmderr_q[1]     <= data_w[ 9] ? 0 : cmderr_q[1];
            cmderr_q[2]     <= data_w[10] ? 0 : cmderr_q[2];
            issue_command_q <= 1'b0;
            is_mem_access_q <= 1'b0;
        end
        else if ((cmderr_q == 3'h0) && command_wrsel_w) begin
            command_q       <= data_w;
            issue_command_q <= 1'b0;
            is_mem_access_q <= 1'b0;

            if (cmdtype_w == 8'h0) begin       //Access register
                if (aarsize_w > 3'h2 || postexec_w == 1'b1 || aarpostincrement_w == 1'b1) begin
                    cmderr_q <= 3'h2; 
                end
                else begin
                    issue_command_q <= 1'b1;
                end
            end
            else if (cmdtype_w == 8'h2) begin  //Access memory
                if (!hart_halted_q) begin      //hart should be halted when access memory
                    cmderr_q <= 3'h4;
                end
                else if (aamsize_w > 3'h2) begin
                    cmderr_q <= 3'h2;
                end
                else if (mem_unaligned_r) begin
                    cmderr_q <= 3'h5;
                end
                else begin
                    issue_command_q <= 1'b1;
                    is_mem_access_q <= 1'b1;
                end
            end
            else begin  //not supported
                cmderr_q        <= 3'h2; 
            end
        end
        else if (is_mem_access_q && mem_wb_valid) begin
            issue_command_q <= 1'b0;
            is_mem_access_q <= 1'b0;

            if (mem_d_error_i)
                cmderr_q <= 3'h5;
        end
        else begin  //issue command keep active only 1 cycle
            issue_command_q <= 1'b0;
        end
    end

    assign abstractcs_w[31:13] = 19'h0;
    assign abstractcs_w[12:11] = {busy_q, 1'b0};
    assign abstractcs_w[10: 8] = cmderr_q;
    assign abstractcs_w[ 7: 0] = 8'h2;


    //-----------------------------------------
    // DM DATA registers
    // ----------------------------------------

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) 
            data0_q <= 32'h0; 
        else if(!dmactive_w)    //reset DM
            data0_q <= 32'h0; 
        else if (data0_wrsel_w & (!busy_q)) 
            data0_q <= data_w; 
        //changed by abstract access register/memory
        else if (gpr_read_valid_q)
            data0_q <= gpr_data_rd_i;
        else if (csr_read_valid_q)
            data0_q <= csr_data_rd_i;
        else if (is_mem_access_q && !write_w && mem_wb_valid) //read from memory
            data0_q <= mem_wb_value;
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) 
            data1_q <= 32'h0; 
        else if(!dmactive_w)    //reset DM
            data1_q <= 32'h0; 
        else if (data1_wrsel_w & (!busy_q)) 
            data1_q <= data_w; 
        //changed by abstract access register/memory
        else if (is_mem_access_q && aampostincrement_w && mem_wb_valid) begin
            case (aamsize_w)
                3'h0: data1_q <= data1_q + 1;
                3'h1: data1_q <= data1_q + 2;
                3'h2: data1_q <= data1_q + 4;
                default: ;
            endcase
        end
    end

    //-----------------------------------------
    // DMI read DM register data output
    // ----------------------------------------
    reg   [31:0]  read_data_r;

    always @(*) begin
        read_data_r = 32'h0;

        if (op_w == DTM_OP_READ) begin
            case (addr_w)
                DMSTATUS_A:
                    read_data_r = dmstatus_w;
                DMCONTROL_A:
                    read_data_r = dmcontrol_q;
                ABSTRACTCS_A:
                    read_data_r = abstractcs_w;
                DATA0_A:
                    read_data_r = data0_q;
                DATA1_A:
                    read_data_r = data1_q;
                default:
                    read_data_r = 32'h0;
            endcase
        end
    end

    //-----------------------------------------------------
    // DM abstract command -- access hart GPR/CSR register
    // ----------------------------------------------------
    reg  [  4:0]     gpr_waddr_q       ;
    reg  [ 31:0]     gpr_data_wr_q     ;
    reg  [  4:0]     gpr_raddr_q       ;
    reg              gpr_read_valid_q  ;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            gpr_waddr_q      <= 5'h0;
            gpr_data_wr_q    <= 32'h0;
            gpr_raddr_q      <= 5'h0;
            gpr_read_valid_q <= 1'b0;
        end
        else if(!dmactive_w) begin   //reset DM
            gpr_waddr_q      <= 5'h0;
            gpr_data_wr_q    <= 32'h0;
            gpr_raddr_q      <= 5'h0;
            gpr_read_valid_q <= 1'b0;
        end
        /* verilator lint_off UNSIGNED */
        else if (issue_command_q && (cmdtype_w == 8'h0) && (regno_w >= 16'h1000) && (regno_w <= 16'h101f)) begin 
        /* verilator lint_on UNSIGNED */
            if (transfer_w && write_w) begin          //write GPR register
                /* verilator lint_off WIDTH */
                gpr_waddr_q   <= regno_w - 16'h1000;
                /* verilator lint_on WIDTH */
                gpr_data_wr_q <= data0_q;
            end
            else if (transfer_w && (!write_w)) begin   //read GPR register
                /* verilator lint_off WIDTH */
                gpr_raddr_q      <= regno_w - 16'h1000;
                /* verilator lint_on WIDTH */
                gpr_read_valid_q <= 1'b1;
            end
        end
        else begin
            gpr_waddr_q   <= 5'h0;
            gpr_data_wr_q <= 32'h0;
            gpr_raddr_q   <= 5'h0;
            gpr_read_valid_q <= 1'b0;
        end
    end

    assign gpr_waddr_o   = gpr_waddr_q   ;
    assign gpr_data_wr_o = gpr_data_wr_q ;
    assign gpr_raddr_o   = gpr_raddr_q   ;

    reg              csr_write_q       ;
    reg [ 11:0]      csr_waddr_q       ;
    reg [ 31:0]      csr_data_wr_q     ;
    reg [ 11:0]      csr_raddr_q       ;
    reg              csr_read_valid_q  ;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            csr_write_q      <= 1'b0;
            csr_waddr_q      <= 12'h0;
            csr_data_wr_q    <= 32'h0;
            csr_raddr_q      <= 12'h0;
            csr_read_valid_q <= 1'b0;
        end
        else if(!dmactive_w) begin   //reset DM
            csr_write_q      <= 1'b0;
            csr_waddr_q      <= 12'h0;
            csr_data_wr_q    <= 32'h0;
            csr_raddr_q      <= 12'h0;
            csr_read_valid_q <= 1'b0;
        end
        /* verilator lint_off UNSIGNED */
        else if (issue_command_q && (cmdtype_w == 8'h0) && (regno_w >= 16'h0) && (regno_w <= 16'h0fff)) begin 
        /* verilator lint_on UNSIGNED */
            if (transfer_w && write_w) begin          //write CSR register
                csr_write_q   <= 1'b1;
                /* verilator lint_off WIDTH */
                csr_waddr_q   <= regno_w ;
                /* verilator lint_on WIDTH */
                csr_data_wr_q <= data0_q;
            end
            else if (transfer_w && (!write_w)) begin   //read CSR register
                /* verilator lint_off WIDTH */
                csr_raddr_q      <= regno_w;
                /* verilator lint_on WIDTH */
                csr_read_valid_q <= 1'b1;
            end
        end
        else begin
            csr_write_q      <= 1'b0;
            csr_waddr_q      <= 12'h0;
            csr_data_wr_q    <= 32'h0;
            csr_raddr_q      <= 12'h0;
            csr_read_valid_q <= 1'b0;
        end
    end

    assign csr_write_o   = csr_write_q   ;
    assign csr_waddr_o   = csr_waddr_q   ;
    assign csr_data_wr_o = csr_data_wr_q ;
    assign csr_raddr_o   = csr_raddr_q   ;

    //-------------------------------------------
    // DM abstract command -- access hart memory
    // Reference design: biriscv_lsu.v
    // ------------------------------------------
    reg [ 31:0]  mem_addr_q;
    reg [ 31:0]  mem_data_wr_q;
    reg          mem_rd_q;
    reg [  3:0]  mem_wr_q;
    reg          mem_cacheable_q;
    
    reg          mem_load_q;
    reg          mem_xb_q;
    reg          mem_xh_q;

    // Outstanding Access Tracking
    reg pending_lsu_e2_q;
    
    wire issue_lsu_e1_w    = (mem_d_rd_o || (|mem_d_wr_o)) && mem_d_accept_i;
    wire complete_ok_e2_w  = mem_d_ack_i & ~mem_d_error_i;
    wire complete_err_e2_w = mem_d_ack_i & mem_d_error_i;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            pending_lsu_e2_q <= 1'b0;
        else if (issue_lsu_e1_w)
            pending_lsu_e2_q <= 1'b1;
        else if (complete_ok_e2_w || complete_err_e2_w)
            pending_lsu_e2_q <= 1'b0;
    end

    // Delay next instruction if outstanding response is late
    wire delay_lsu_e2_w = pending_lsu_e2_q && !complete_ok_e2_w;

    // Combinatorial
    reg [31:0]  mem_addr_r;
    reg         mem_unaligned_r;
    reg [31:0]  mem_data_r;
    reg         mem_rd_r;
    reg [3:0]   mem_wr_r;

    always @(*) begin
        mem_addr_r      = 32'h0;
        mem_data_r      = 32'h0;
        mem_unaligned_r = 1'b0;
        mem_wr_r        = 4'b0;
        mem_rd_r        = 1'b0;
    
        mem_addr_r      = data1_q;

        if (aamsize_w == 3'h2)
            mem_unaligned_r = (mem_addr_r[1:0] != 2'b0);
        else if (aamsize_w == 3'h1)
            mem_unaligned_r = mem_addr_r[0];
    
        mem_rd_r = (issue_command_q && is_mem_access_q && !write_w && !mem_unaligned_r);
    
        if (issue_command_q && is_mem_access_q && (write_w && aamsize_w == 3'h2) && !mem_unaligned_r)
        begin
            mem_data_r  = data0_q;
            mem_wr_r    = 4'hf;
        end
        else if (issue_command_q && is_mem_access_q && (write_w && aamsize_w == 3'h1) && !mem_unaligned_r)
        begin
            case (mem_addr_r[1:0])
            2'h2 :
            begin
                mem_data_r  = {data0_q[15:0], 16'h0};
                mem_wr_r    = 4'b1100;
            end
            default :
            begin
                mem_data_r  = {16'h0, data0_q[15:0]};
                mem_wr_r    = 4'b0011;
            end
            endcase
        end
        else if (issue_command_q && is_mem_access_q && write_w && aamsize_w == 3'h0)
        begin
            case (mem_addr_r[1:0])
            2'h3 :
            begin
                mem_data_r  = {data0_q[7:0],24'h000000};
                mem_wr_r    = 4'b1000;
            end
            2'h2 :
            begin
                mem_data_r  = {{8'h00,data0_q[7:0]},16'h0000};
                mem_wr_r    = 4'b0100;
            end
            2'h1 :
            begin
                mem_data_r  = {{16'h0000,data0_q[7:0]},8'h00};
                mem_wr_r    = 4'b0010;
            end
            2'h0 :
            begin
                mem_data_r  = {24'h000000,data0_q[7:0]};
                mem_wr_r    = 4'b0001;
            end
            default :
            ;
            endcase
        end
        else
            mem_wr_r    = 4'b0;
    end

    // Sequential
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
        begin
            mem_addr_q         <= 32'b0;
            mem_data_wr_q      <= 32'b0;
            mem_rd_q           <= 1'b0;
            mem_wr_q           <= 4'b0;
            mem_cacheable_q    <= 1'b0;
            mem_load_q         <= 1'b0;
            mem_xb_q           <= 1'b0;
            mem_xh_q           <= 1'b0;
        end
        // Memory access fault 
        else if (complete_err_e2_w)
        begin
            mem_addr_q         <= 32'b0;
            mem_data_wr_q      <= 32'b0;
            mem_rd_q           <= 1'b0;
            mem_wr_q           <= 4'b0;
            mem_cacheable_q    <= 1'b0;
            mem_load_q         <= 1'b0;
            mem_xb_q           <= 1'b0;
            mem_xh_q           <= 1'b0;
        end
        else if ((mem_rd_q || (|mem_wr_q)) && delay_lsu_e2_w)
            ;
        else if (!((mem_d_rd_o || mem_d_wr_o != 4'b0) && !mem_d_accept_i))
        begin
            mem_addr_q         <= mem_addr_r;
            mem_data_wr_q      <= mem_data_r;
            mem_rd_q           <= mem_rd_r;
            mem_wr_q           <= mem_wr_r;
            mem_load_q         <= (!write_w) & is_mem_access_q & issue_command_q;
            mem_xb_q           <= aamsize_w == 3'h0;
            mem_xh_q           <= aamsize_w == 3'h1;
        
            /* verilator lint_off UNSIGNED */
            /* verilator lint_off CMPCONST */
            mem_cacheable_q    <= (mem_addr_r >= MEM_CACHE_ADDR_MIN && mem_addr_r <= MEM_CACHE_ADDR_MAX);
            /* verilator lint_on CMPCONST */
            /* verilator lint_on UNSIGNED */
        end
    end

    assign mem_d_addr_o       = {mem_addr_q[31:2], 2'b0};
    assign mem_d_data_wr_o    = mem_data_wr_q;
    assign mem_d_rd_o         = mem_rd_q & ~delay_lsu_e2_w;
    assign mem_d_wr_o         = mem_wr_q & ~{4{delay_lsu_e2_w}};
    assign mem_d_cacheable_o  = mem_cacheable_q;
    assign mem_d_req_tag_o    = 11'b0;
    assign mem_d_invalidate_o = 1'b0;
    assign mem_d_writeback_o  = 1'b0;
    assign mem_d_flush_o      = 1'b0;

    assign bus_req_o = is_mem_access_q;

    // Stall upstream busy
    wire stall_w  = ((mem_d_rd_o || mem_d_wr_o != 4'b0) && !mem_d_accept_i) || delay_lsu_e2_w;

    // Response from memory access
    wire        mem_resp_load_w;
    wire [31:0] mem_resp_addr_w;
    wire        mem_resp_byte_w;
    wire        mem_resp_half_w;

    jtag_dm_fifo
    #(
        .WIDTH     (35) ,
        .DEPTH     (2)  ,
        .ADDR_W    (1)  
    )
    u_mem_request
    (
        .clk         (clk)  ,
        .rst_n       (rst_n),
    
        .push_i      (((mem_d_rd_o || (|mem_d_wr_o)) && mem_d_accept_i)) ,
        .data_in_i   ({mem_addr_q, mem_xh_q, mem_xb_q, mem_load_q}) ,
        .accept_o    (),
    
        .valid_o     (),
        .data_out_o  ({mem_resp_addr_w, mem_resp_half_w, mem_resp_byte_w, mem_resp_load_w}),
        .pop_i       (mem_d_ack_i) 
    );

    //-----------------------------------------------------------------
    // Load response
    //-----------------------------------------------------------------
    reg [1:0]  addr_lsb_r;
    reg        load_byte_r;
    reg        load_half_r;
    reg        load_signed_r;
    reg [31:0] wb_result_r;

    always @(*) begin
        wb_result_r   = 32'b0;
    
        // Tag associated with load
        addr_lsb_r    = mem_resp_addr_w[1:0];
        load_byte_r   = mem_resp_byte_w;
        load_half_r   = mem_resp_half_w;
    
        // Access fault-pass 
        if (mem_d_ack_i && mem_d_error_i)
            wb_result_r = mem_resp_addr_w;
        // Handle responses
        else if (mem_d_ack_i && mem_resp_load_w)
        begin
            if (load_byte_r)
            begin
                case (addr_lsb_r[1:0])
                2'h3: wb_result_r = {24'b0, mem_d_data_rd_i[31:24]};
                2'h2: wb_result_r = {24'b0, mem_d_data_rd_i[23:16]};
                2'h1: wb_result_r = {24'b0, mem_d_data_rd_i[15:8]};
                2'h0: wb_result_r = {24'b0, mem_d_data_rd_i[7:0]};
                endcase
            end
            else if (load_half_r)
            begin
                if (addr_lsb_r[1])
                    wb_result_r = {16'b0, mem_d_data_rd_i[31:16]};
                else
                    wb_result_r = {16'b0, mem_d_data_rd_i[15:0]};
            end
            else begin
                wb_result_r = mem_d_data_rd_i;
            end
        end
    end

    wire        mem_wb_valid = mem_d_ack_i;
    wire [31:0] mem_wb_value = wb_result_r;    


    //-----------------------------------------
    // DM response to DTM 
    // ----------------------------------------
    localparam IDLE         = 4'h0;
    localparam DMI_OP       = 4'h1;
    localparam DM_REG       = 4'h2;
    localparam COMMAND      = 4'h3;
    localparam HART_REG     = 4'h4;
    localparam HART_MEM     = 4'h5;
    localparam CMD_ERR      = 4'h6;
    localparam MEM_DONE     = 4'h7;
    localparam PAUSE        = 4'h8;
    localparam RESPONSE     = 4'h9;

    //Sync dtm_ack_i
    reg   dtm_ack_d1, dtm_ack_d2;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            {dtm_ack_d1, dtm_ack_d2} <= 2'b0;
        else
            {dtm_ack_d1, dtm_ack_d2} <= {dtm_ack_i, dtm_ack_d1};
    end    

    //delay mem_ack_i
    reg   mem_d_ack_d1, mem_d_ack_d2;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            {mem_d_ack_d1, mem_d_ack_d2} <= 2'b0;
        else
            {mem_d_ack_d1, mem_d_ack_d2} <= {mem_d_ack_i, mem_d_ack_d1};
    end    

    //DM response state machine
    reg   [3:0] next_state_r;
    reg   [3:0] current_state_q;
    reg   [3:0] prev_state_q;

    // Next state logic
    always @(*) begin
        next_state_r = current_state_q;

        case (current_state_q)
            IDLE:
                if (dm_ack_pul_q)
                    next_state_r = DMI_OP;
            DMI_OP:
                if (op_w == DTM_OP_WRITE && addr_w == COMMAND_A)
                    next_state_r = COMMAND;
                else
                    next_state_r = DM_REG;
            DM_REG:
                next_state_r = PAUSE;
            COMMAND:
                if (|cmderr_q)
                    next_state_r = CMD_ERR;
                else if (is_mem_access_q)
                    next_state_r = HART_MEM;
                else
                    next_state_r = HART_REG;
            CMD_ERR:
                next_state_r = PAUSE;
            HART_REG:
                next_state_r = PAUSE;
            HART_MEM:
                if (mem_d_ack_i | mem_d_ack_d1 | mem_d_ack_d2)
                    next_state_r = MEM_DONE;
            MEM_DONE:
                next_state_r = PAUSE;
            PAUSE:
                next_state_r = RESPONSE;
            RESPONSE:
                if (dtm_ack_d2)
                    next_state_r = IDLE;
            default: ;
        endcase
    end

    // Update current state
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            current_state_q   <= IDLE;
            prev_state_q      <= IDLE;
        end
        else begin
            current_state_q   <= next_state_r;
            prev_state_q      <= current_state_q;
        end
    end    

    // Generate response 
    reg [DMI_ADDR_W+33:0] dm_resp_data_q;
    reg                   dm_resp_q;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) 
            dm_resp_data_q <= {(DMI_ADDR_W+34){1'b0}};
        else if (current_state_q == PAUSE) begin
            if (prev_state_q == DM_REG) 
                dm_resp_data_q <= {addr_w, read_data_r, OP_SUCCESS};
            else if (prev_state_q == HART_REG) 
                dm_resp_data_q <= {addr_w, 32'h0, OP_SUCCESS};
            else if (prev_state_q == CMD_ERR) 
                dm_resp_data_q <= {addr_w, 32'h0, OP_FAIL};
            else if (prev_state_q == MEM_DONE && (|cmderr_q)) 
                dm_resp_data_q <= {addr_w, 32'h0, OP_FAIL};
            else 
                dm_resp_data_q <= {addr_w, 32'h0, OP_SUCCESS};
        end
        else if (current_state_q == IDLE)
            dm_resp_data_q <= {(DMI_ADDR_W+34){1'b0}};
    end    

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) 
            dm_resp_q <= 1'b0;
        else if (current_state_q == PAUSE && next_state_r == RESPONSE)
            dm_resp_q <= 1'b1;
        else if (dtm_ack_d2 || current_state_q == IDLE) 
            dm_resp_q <= 1'b0;
    end    

    assign dm_resp_o      = dm_resp_q; 
    assign dm_resp_data_o = dm_resp_data_q; 

endmodule


module jtag_dm_fifo
//-----------------------------------------------------------------
// Params
//-----------------------------------------------------------------
#(
    parameter WIDTH   = 8,
    parameter DEPTH   = 4,
    parameter ADDR_W  = 2
)
//-----------------------------------------------------------------
// Ports
//-----------------------------------------------------------------
(
    // Inputs
    input               clk       ,
    input               rst_n     ,
    input  [WIDTH-1:0]  data_in_i ,
    input               push_i    ,
    input               pop_i     ,

    // Outputs
    output [WIDTH-1:0]  data_out_o ,
    output              accept_o   ,
    output              valid_o    
);

    //-----------------------------------------------------------------
    // Local Params
    //-----------------------------------------------------------------
    localparam COUNT_W = ADDR_W + 1;
    
    //-----------------------------------------------------------------
    // Registers
    //-----------------------------------------------------------------
    reg [WIDTH-1:0]   ram_q[DEPTH-1:0];
    reg [ADDR_W-1:0]  rd_ptr_q;
    reg [ADDR_W-1:0]  wr_ptr_q;
    reg [COUNT_W-1:0] count_q;

    integer i;

    //-----------------------------------------------------------------
    // Sequential
    //-----------------------------------------------------------------
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
        begin
            count_q   <= {(COUNT_W) {1'b0}};
            rd_ptr_q  <= {(ADDR_W) {1'b0}};
            wr_ptr_q  <= {(ADDR_W) {1'b0}};
        
            for (i=0;i<DEPTH;i=i+1)
            begin
                ram_q[i] <= {(WIDTH) {1'b0}};
            end
        end
        else begin
            // Push
            if (push_i & accept_o)
            begin
                ram_q[wr_ptr_q] <= data_in_i;
                wr_ptr_q        <= wr_ptr_q + 1;
            end
        
            // Pop
            if (pop_i & valid_o)
                rd_ptr_q      <= rd_ptr_q + 1;
        
            // Count up
            if ((push_i & accept_o) & ~(pop_i & valid_o))
                count_q <= count_q + 1;
            // Count down
            else if (~(push_i & accept_o) & (pop_i & valid_o))
                count_q <= count_q - 1;
        end
    end

    //-------------------------------------------------------------------
    // Combinatorial
    //-------------------------------------------------------------------
    /* verilator lint_off WIDTH */
    assign valid_o       = (count_q != 0);
    assign accept_o      = (count_q != DEPTH);
    /* verilator lint_on WIDTH */
    
    assign data_out_o    = ram_q[rd_ptr_q];

endmodule

