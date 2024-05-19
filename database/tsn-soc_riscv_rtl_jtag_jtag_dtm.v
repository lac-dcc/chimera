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
 * JTAG Debug Transport Module
-*/

module jtag_dtm
//-----------------------------------------------------------------
// Params
//-----------------------------------------------------------------
#(
    parameter DMI_ADDR_W = 7
)
//-----------------------------------------------------------------
// Ports
//-----------------------------------------------------------------
(
    // Inputs
    input                    rst_n          ,

    // JTAG ports
    input                    tck_i          , 
    input                    tms_i          , 
    input                    tdi_i          , 
    output                   tdo_o          ,

    // DMI interface
    input                    dm_resp_i      ,
    input  [DMI_ADDR_W+33:0] dm_resp_data_i ,
    output                   dtm_ack_o      ,

    input                    dm_ack_i       ,
    output                   dtm_req_o      ,
    output [DMI_ADDR_W+33:0] dtm_req_data_o ,

    output                   dmihardreset_o
);
    //--------------------------------------------
    // local parameters
    //--------------------------------------------
    localparam IDCODE_VERSION     = 4'h1;
    localparam IDCODE_PART_NUMBER = 16'h1588;
    localparam IDCODE_MANUFLD     = 11'h301;

    localparam DTM_VERSION  = 4'h1;
    localparam IR_W         = 5;
    localparam SHIFT_REG_W  = DMI_ADDR_W + 34;

    // DTM TAP register addresses
    localparam BYPASS_A    = 5'h1f;
    localparam IDCODE_A    = 5'h01;
    localparam DMI_A       = 5'h11;
    localparam DTMCS_A     = 5'h10;

    // TAP states
    localparam TEST_LOGIC_RESET  = 4'h0;
    localparam RUN_TEST_IDLE     = 4'h1;
    localparam SELECT_DR_SCAN    = 4'h2;
    localparam CAPTURE_DR        = 4'h3;
    localparam SHIFT_DR          = 4'h4;
    localparam EXIT_1_DR         = 4'h5;
    localparam PAUSE_DR          = 4'h6;
    localparam EXIT_2_DR         = 4'h7;
    localparam UPDATE_DR         = 4'h8;
    localparam SELECT_IR_SCAN    = 4'h9;
    localparam CAPTURE_IR        = 4'hA;
    localparam SHIFT_IR          = 4'hB;
    localparam EXIT_1_IR         = 4'hC;
    localparam PAUSE_IR          = 4'hD;
    localparam EXIT_2_IR         = 4'hE;
    localparam UPDATE_IR         = 4'hF;

    //-------------------------------------
    // Registers / Wires
    // ------------------------------------
    wire                    busy_w;
    wire  [1:0]             dmi_stat_w;
    wire  [SHIFT_REG_W-1:0] busy_resp_w;
    wire  [SHIFT_REG_W-1:0] not_busy_resp_w;

    reg   [DMI_ADDR_W+33:0] dtm_req_data_q;
    reg   [DMI_ADDR_W+33:0] dm_resp_data_q;   

    wire  [5:0]  addr_bits_w = DMI_ADDR_W[5:0];
    wire  [31:0] idcode_w = {IDCODE_VERSION, IDCODE_PART_NUMBER, IDCODE_MANUFLD, 1'h1};
    wire  [31:0] dtmcs_w  = {    14'b0,
                                 1'b0,         // dmihardreset
                                 1'b0,         // dmireset
                                 1'b0,
                                 3'h5,         // idle
                                 dmi_stat_w,   // dmistat
                                 addr_bits_w,  // abits
                                 DTM_VERSION   // version
                             }; 

    assign dmi_stat_w = busy_w ? 2'b01 : 2'b00;
    assign busy_resp_w = {{(DMI_ADDR_W+32){1'b0}}, 2'b11};  // op = 2'b11
    assign not_busy_resp_w = dm_resp_data_q;


    //-----------------------------------------------------------------------------------
    // State machine
    // JTAG samples the TMS signal and TDI signal on the rising edge of each TCK signal to
    // determine whether the state machine state has changed, and outputs the TDO signal on 
    // the falling edge of each TCK signal. Regardless of which state the TAP is currently
    // in, as long as the TMS remains high for 5 TCK clocks, the TAP will surely return to 
    // Test-Logic-Reset state.
    //-----------------------------------------------------------------------------------
    reg   [3:0] next_state_r;
    reg   [3:0] current_state_q;

    // Next state logic
    always @(*) begin
        next_state_r = current_state_q;

        case (current_state_q)
            TEST_LOGIC_RESET  : next_state_r = tms_i ? TEST_LOGIC_RESET : RUN_TEST_IDLE;
            RUN_TEST_IDLE     : next_state_r = tms_i ? SELECT_DR_SCAN   : RUN_TEST_IDLE;
            SELECT_DR_SCAN    : next_state_r = tms_i ? SELECT_IR_SCAN   : CAPTURE_DR;
            CAPTURE_DR        : next_state_r = tms_i ? EXIT_1_DR        : SHIFT_DR;
            SHIFT_DR          : next_state_r = tms_i ? EXIT_1_DR        : SHIFT_DR;
            EXIT_1_DR         : next_state_r = tms_i ? UPDATE_DR        : PAUSE_DR;
            PAUSE_DR          : next_state_r = tms_i ? EXIT_2_DR        : PAUSE_DR;
            EXIT_2_DR         : next_state_r = tms_i ? UPDATE_DR        : SHIFT_DR;
            UPDATE_DR         : next_state_r = tms_i ? SELECT_DR_SCAN   : RUN_TEST_IDLE;
            SELECT_IR_SCAN    : next_state_r = tms_i ? TEST_LOGIC_RESET : CAPTURE_IR;
            CAPTURE_IR        : next_state_r = tms_i ? EXIT_1_IR        : SHIFT_IR;
            SHIFT_IR          : next_state_r = tms_i ? EXIT_1_IR        : SHIFT_IR;
            EXIT_1_IR         : next_state_r = tms_i ? UPDATE_IR        : PAUSE_IR;
            PAUSE_IR          : next_state_r = tms_i ? EXIT_2_IR        : PAUSE_IR;
            EXIT_2_IR         : next_state_r = tms_i ? UPDATE_IR        : SHIFT_IR;
            UPDATE_IR         : next_state_r = tms_i ? SELECT_DR_SCAN   : RUN_TEST_IDLE; 
            default ;
        endcase
    end

    // Update current state
    always @(posedge tck_i or negedge rst_n) begin
        if (!rst_n)
            current_state_q   <= TEST_LOGIC_RESET;
        else
            current_state_q   <= next_state_r;
    end    

    //-----------------------------------------------
    // IR / DR shift register
    //-----------------------------------------------
    reg   [SHIFT_REG_W-1:0] shift_reg_q;
    reg   [IR_W-1:0]        ir_reg_q;

    always @(posedge tck_i) begin
        case (current_state_q)
        // IR
        CAPTURE_IR: 
            shift_reg_q <= {{(SHIFT_REG_W-1){1'b0}}, 1'b1}; //It must be b01 per JTAG spec 
        SHIFT_IR  : 
            shift_reg_q <= {{(SHIFT_REG_W-IR_W){1'b0}}, tdi_i, shift_reg_q[IR_W-1:1]}; // right shift 1 bit, IR_W bit register
        // DR
        CAPTURE_DR: 
            case (ir_reg_q) 
            BYPASS_A : 
                shift_reg_q <= {(SHIFT_REG_W){1'b0}};
            IDCODE_A : 
                shift_reg_q <= {{(SHIFT_REG_W-32){1'b0}}, idcode_w};
            DTMCS_A  : 
                shift_reg_q <= {{(SHIFT_REG_W-32){1'b0}}, dtmcs_w};
            DMI_A    : 
                shift_reg_q <= busy_w ? busy_resp_w : not_busy_resp_w;
            default:
                shift_reg_q <= {(SHIFT_REG_W){1'b0}};
            endcase
        SHIFT_DR  : 
            case (ir_reg_q) 
            BYPASS_A : 
                shift_reg_q <= {{(SHIFT_REG_W-1 ){1'b0}}, tdi_i}; // in = out, bypass
            IDCODE_A : 
                shift_reg_q <= {{(SHIFT_REG_W-32){1'b0}}, tdi_i, shift_reg_q[31:1]}; // right shift 1 bit, 32 bit register
            DTMCS_A  : 
                shift_reg_q <= {{(SHIFT_REG_W-32){1'b0}}, tdi_i, shift_reg_q[31:1]}; // right shift 1 bit, 32 bit register
            DMI_A    : 
                shift_reg_q <= {tdi_i, shift_reg_q[SHIFT_REG_W-1:1]}; // right shift 1 bit, SHIFT_REG_W bit register
            default:
                shift_reg_q <= {{(SHIFT_REG_W-1){1'b0}} , tdi_i}; //bypass
            endcase 
        default: ;
        endcase
    end

    //-------------------------------------------------------
    // DTM request /DM response
    //-------------------------------------------------------
    reg   dm_ack_d1, dm_ack_d2; 

    always @(posedge tck_i or negedge rst_n) begin
        if (!rst_n)
            {dm_ack_d1, dm_ack_d2} <= 2'b0;
        else
            {dm_ack_d1, dm_ack_d2} <= {dm_ack_i, dm_ack_d1};
    end    

    reg                   dtm_req_q      ;

    always @(posedge tck_i or negedge rst_n) begin
        if (!rst_n) begin
            dtm_req_q      <= 1'b0;
            dtm_req_data_q <= {(DMI_ADDR_W+34){1'b0}};
        end
        else if(current_state_q == UPDATE_DR && ir_reg_q == DMI_A && (!busy_w)) begin
            dtm_req_q      <= 1'b1;
            dtm_req_data_q <= shift_reg_q;
        end
        else if (dm_ack_d2 == 1'b1) begin
            dtm_req_q      <= 1'b0;
            dtm_req_data_q <= {(DMI_ADDR_W+34){1'b0}};
        end
    end    

    reg   dm_resp_d1, dm_resp_d2;
    wire  dtm_ack_w;
    reg   dtm_ack_q;

    always @(posedge tck_i or negedge rst_n) begin
        if (!rst_n)
            {dm_resp_d1, dm_resp_d2} <= 2'b0;
        else
            {dm_resp_d1, dm_resp_d2} <= {dm_resp_i, dm_resp_d1};
    end    

    assign dtm_ack_w = (dm_resp_d2 == 1'b1) ? 1'b1 : 1'b0;

    always @(posedge tck_i or negedge rst_n) begin
        if (!rst_n)
            dtm_ack_q <= 1'b0;
        else
            dtm_ack_q <= dtm_ack_w;
    end    

    always @(posedge tck_i or negedge rst_n) begin
        if (!rst_n)
            dm_resp_data_q <= {(DMI_ADDR_W+34){1'b0}};
        else if (dtm_ack_w & (!dtm_ack_q))
            dm_resp_data_q <= dm_resp_data_i;
    end    

    // busy, transaction not finished
    reg   dm_busy_r;
    reg   dm_busy_q;

    always @(*) begin
        dm_busy_r = dm_busy_q;

        if(dtm_req_q)
            dm_busy_r = 1'b1;
        else if(dtm_ack_q & (!dtm_ack_w))
            dm_busy_r = 1'b0;
    end

    always @(posedge tck_i or negedge rst_n) begin
        if (!rst_n)
            dm_busy_q <= 1'b0;
        else
            dm_busy_q <= dm_busy_r;
    end    

    // Sticky error, previous transaction not completed yet.
    reg   sticky_error_r;
    reg   sticky_error_q;
    wire  dmireset_w = shift_reg_q[16];    

    always @(*) begin
        sticky_error_r = sticky_error_q;

        if(current_state_q == UPDATE_DR && ir_reg_q == DTMCS_A && dmireset_w == 1'b1) 
            sticky_error_r = 1'b0;
        else if(current_state_q == CAPTURE_DR && ir_reg_q == DMI_A)
            sticky_error_r = busy_w;
    end

    always @(posedge tck_i or negedge rst_n) begin
        if (!rst_n)
            sticky_error_q <= 1'b0;
        else 
            sticky_error_q <= sticky_error_r;
    end    

    assign busy_w = sticky_error_q | dm_busy_r; 

    // DMI hardreset, 1 cycle pulse
    reg   dmihardreset_q;
    wire  dmihardreset_w = shift_reg_q[17];    

    always @(posedge tck_i) begin
        if (current_state_q == UPDATE_DR && ir_reg_q == DTMCS_A && dmihardreset_w == 1'b1)
            dmihardreset_q <= 1'b1;
        else
            dmihardreset_q <= 1'b0;
    end    

    // TAP IR register
    always @(negedge tck_i) begin
        if (current_state_q == TEST_LOGIC_RESET) begin
            ir_reg_q <= IDCODE_A;
        end 
        else if (current_state_q == UPDATE_IR) begin
            ir_reg_q <= shift_reg_q[IR_W-1:0];
        end
    end

    // TDO output
    reg   tdo_q;

    always @(negedge tck_i) begin
        if (current_state_q == SHIFT_IR) begin
            tdo_q <= shift_reg_q[0];
        end 
        else if (current_state_q == SHIFT_DR) begin
            tdo_q <= shift_reg_q[0];
        end 
        else begin
            tdo_q <= 1'b0;
        end
    end

    //-------------------------------------------------
    // Outputs
    //-------------------------------------------------
    assign tdo_o          = tdo_q;

    assign dtm_ack_o      = dtm_ack_q;
    assign dtm_req_o      = dtm_req_q;
    assign dtm_req_data_o = dtm_req_data_q;

    assign dmihardreset_o = dmihardreset_q;

`ifdef verilator
    /* verilator lint_off UNDRIVEN */
    /* verilator lint_off WIDTH */

    export "DPI-C" function get_ir;
    
    //-------------------------------------------------------------
    // get the value of Instruction Register
    //-------------------------------------------------------------
    function byte get_ir; 
    begin
        get_ir = ir_reg_q;
    end
    endfunction
    
    export "DPI-C" function get_shift_lo;
    
    //-------------------------------------------------------------
    // get lower 32 bit of shift register
    //-------------------------------------------------------------
    function int get_shift_lo; 
    begin
        get_shift_lo = shift_reg_q[31:0];
    end
    endfunction

    export "DPI-C" function get_shift_hi;

    //-------------------------------------------------------------
    // get higher SHIFT_REG_W-32 bit of shift register
    //-------------------------------------------------------------
    function int get_shift_hi; 
    begin
        get_shift_hi = shift_reg_q[SHIFT_REG_W-1:32];
    end
    endfunction

    /* verilator lint_on WIDTH */
    /* verilator lint_on UNDRIVEN */  
`endif

endmodule

