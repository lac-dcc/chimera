// This program was cloned from: https://github.com/OpenCAPI/ThymesisFlow
// License: Apache License 2.0

// *!***************************************************************************
// *! Copyright 2019 International Business Machines
// *!
// *! Licensed under the Apache License, Version 2.0 (the "License");
// *! you may not use this file except in compliance with the License.
// *! You may obtain a copy of the License at
// *! http://www.apache.org/licenses/LICENSE-2.0 
// *!
// *! The patent license granted to you in Section 3 of the License, as applied
// *! to the "Work," hereby includes implementations of the Work in physical form.  
// *!
// *! Unless required by applicable law or agreed to in writing, the reference design
// *! distributed under the License is distributed on an "AS IS" BASIS,
// *! WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// *! See the License for the specific language governing permissions and
// *! limitations under the License.
// *! 
// *! The background Specification upon which this is based is managed by and available from
// *! the OpenCAPI Consortium.  More information can be found at https://opencapi.org. 
// *!***************************************************************************
`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/17/2016 03:45:39 PM
// Design Name: 
// Module Name: tlx_flit_parser
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: Need to look at staging crc_error to not dump previous validated data
// 
//////////////////////////////////////////////////////////////////////////////////


module ocx_tlx_flit_parser(
    input tlx_clk,
    input reset_n,
    input [511:0] dlx_tlx_flit,
    input dlx_tlx_flit_valid,
    input dlx_tlx_flit_crc_err,
    output [55:0] credit_return,
    output credit_return_v,
    output [167:0] pars_ctl_info,
    output pars_ctl_valid,
    output [511:0] pars_data_flit,
    output pars_data_valid,
    output template0_slot0_v,
    output [27:0] template0_slot0,
    output parser_inprog,
    output [7:0] bad_data_indicator,
    output bookend_flit_v,
    output ctl_flit_parsed,
    output ctl_flit_parse_end,
    output [5:0] ctl_template,
    output [3:0] run_length,
    output crc_error
    );
//Internal signal declarations
wire [511:0] flit_din;
wire [511:0] ctl_flit_din;
wire [511:0] data_flit_din;
wire [3:0]data_cnt_din;
wire [3:0]data_cnt_unverif_din;
wire [55:0] credit_buffer_din;
wire credit_flag_din;
wire data_nctl;
wire flit_valid_s1_din;
reg flit_valid_s1_dout;
wire flit_crc_s1_din;
reg flit_crc_s1_dout;
reg [511:0] flit_dout;
reg [511:0] ctl_flit_dout;
reg [511:0] data_flit_dout;
reg [3:0]data_cnt_dout;
reg [3:0]data_cnt_unverif_dout; //if bad crc is active need to revert the amount of data expected
reg [55:0] credit_buffer_dout;
reg credit_flag_dout;
wire flit_valid_s2_din;
reg flit_valid_s2_dout;
reg flit_valid_s2_clone_dout;
wire flit_valid_s3_din;
reg flit_valid_s3_dout;
wire flit_valid_s4_din;
reg flit_valid_s4_dout;
wire flit_valid_s5_din;
reg flit_valid_s5_dout;
wire flit_valid_s6_din;
reg flit_valid_s6_dout;
wire flit_valid_s7_din;
reg flit_valid_s7_dout;
wire flit_valid_s8_din;
reg flit_valid_s8_dout;
wire flit_valid_s9_din;
reg flit_valid_s9_dout;
wire [167:0] pars_ctl_info_t0_din;
reg  [167:0] pars_ctl_info_t0_dout;
wire [111:0] pars_ctl_info_t1_din;
reg  [111:0] pars_ctl_info_t1_dout;
wire [55:0] pars_ctl_info_t2_din;
reg  [55:0] pars_ctl_info_t2_dout;
wire [167:0] pars_ctl_info_t3_din;
reg  [167:0] pars_ctl_info_t3_dout;
wire [5:0] ctl_info_template_din;
reg  [5:0] ctl_info_template_dout;
wire [5:0] ctl_info_template_s1_din;
reg  [5:0] ctl_info_template_s1_dout;
wire parse_inprog;
wire data_flit_valid_din;
reg data_flit_valid_dout;
wire bookend_flit_valid_din;
reg bookend_flit_valid_dout;
wire [7:0] bdi_din;
reg [7:0] bdi_dout;
wire pars_ctl_valid_din;
reg pars_ctl_valid_dout;
wire parse_block_null;
reg true_bookend_dout;
wire true_bookend_din;
reg ctl_flit_parse_dout;
wire ctl_flit_parse_din;
reg ctl_flit_parse_end_dout;
wire ctl_flit_parse_end_din;
always @(posedge tlx_clk)
    begin
    if (!reset_n)
    begin
        credit_buffer_dout[55:0]   <= 56'b0;  
        flit_dout[511:0]           <= 512'b0;
        ctl_flit_dout[511:0]       <= 512'b0;
        data_flit_dout[511:0]      <= 512'b0;
        flit_valid_s1_dout         <= 1'b0;
        flit_crc_s1_dout           <= 1'b0;
        data_cnt_dout[3:0]         <= 4'b0;
        data_cnt_unverif_dout[3:0] <= 4'b0;
        credit_flag_dout           <= 1'b0;
        flit_valid_s2_dout         <= 1'b0;
        flit_valid_s2_clone_dout   <= 1'b0;
        flit_valid_s3_dout         <= 1'b0;
        flit_valid_s4_dout         <= 1'b0;
        flit_valid_s5_dout         <= 1'b0;
        flit_valid_s6_dout         <= 1'b0;
        flit_valid_s7_dout         <= 1'b0;
        flit_valid_s8_dout         <= 1'b0;
        flit_valid_s9_dout         <= 1'b0;
        pars_ctl_info_t0_dout      <= 168'b0;
        pars_ctl_info_t1_dout      <= 112'b0;
        pars_ctl_info_t2_dout      <= 56'b0;
        pars_ctl_info_t3_dout      <= 168'b0;
        ctl_info_template_dout     <= 6'b0;
        ctl_info_template_s1_dout     <= 6'b0;
        //parse_inprog_dout          <= 1'b0;
        data_flit_valid_dout       <= 1'b0;
        bookend_flit_valid_dout    <= 1'b0;
        bdi_dout    <= 8'b0;
        pars_ctl_valid_dout <= 1'b0;
        true_bookend_dout <= 1'b0;
        ctl_flit_parse_dout <= 1'b0;
        ctl_flit_parse_end_dout <= 1'b0;
    end
    else
        begin
        //create latches
        credit_buffer_dout[55:0] <= credit_buffer_din[55:0]; // grab first two 
        flit_dout[511:0] <= flit_din[511:0];
        ctl_flit_dout[511:0] <= ctl_flit_din[511:0];
        data_flit_dout[511:0] <= data_flit_din[511:0];
        flit_valid_s1_dout <= flit_valid_s1_din;
        flit_crc_s1_dout <= flit_crc_s1_din;
        data_cnt_dout[3:0] <= data_cnt_din[3:0];
        data_cnt_unverif_dout[3:0] <= data_cnt_unverif_din[3:0];
        credit_flag_dout <= credit_flag_din;
        flit_valid_s2_dout <= flit_valid_s2_din;
        flit_valid_s2_clone_dout <= flit_valid_s2_din;
        flit_valid_s3_dout <= flit_valid_s3_din;
        flit_valid_s4_dout <= flit_valid_s4_din;
        flit_valid_s5_dout <= flit_valid_s5_din;
        flit_valid_s6_dout <= flit_valid_s6_din;
        flit_valid_s7_dout <= flit_valid_s7_din;
        flit_valid_s8_dout <= flit_valid_s8_din;
        flit_valid_s9_dout <= flit_valid_s9_din;
        pars_ctl_info_t0_dout <= pars_ctl_info_t0_din;
        pars_ctl_info_t1_dout <= pars_ctl_info_t1_din;
        pars_ctl_info_t2_dout <= pars_ctl_info_t2_din;
        pars_ctl_info_t3_dout <= pars_ctl_info_t3_din;
        ctl_info_template_dout <= ctl_info_template_din;
        ctl_info_template_s1_dout <= ctl_info_template_s1_din;
        //parse_inprog_dout <= parse_inprog_din;
        data_flit_valid_dout <= data_flit_valid_din;
        bookend_flit_valid_dout <= bookend_flit_valid_din;
        bdi_dout <= bdi_din;
        pars_ctl_valid_dout <= pars_ctl_valid_din;
        true_bookend_dout <= true_bookend_din;
        ctl_flit_parse_dout <= ctl_flit_parse_din;
        ctl_flit_parse_end_dout <= ctl_flit_parse_end_din;
        end
    end
    //pipeline control flit valid
    assign flit_valid_s1_din = dlx_tlx_flit_valid & ~dlx_tlx_flit_crc_err; //valid flit available no crc error
    assign flit_valid_s2_din = flit_valid_s1_dout & ~data_nctl & ~parse_block_null & (flit_dout[451:448] <= 4'h8) ;//begin control flit parsing at _s2 valid flit is a control flit, and run length is valid
    assign flit_valid_s3_din = flit_valid_s2_dout & (ctl_info_template_dout != 6'b0); //template zero finish
    assign flit_valid_s4_din = flit_valid_s3_dout; 
    assign flit_valid_s5_din = flit_valid_s4_dout & (ctl_info_template_dout != 6'b000011); //template three finish
    assign flit_valid_s6_din = flit_valid_s5_dout & (ctl_info_template_dout != 6'b000001); //template one finish
    assign flit_valid_s7_din = flit_valid_s6_dout;
    assign flit_valid_s8_din = flit_valid_s7_dout;
    assign flit_valid_s9_din = flit_valid_s8_dout;
    //control flit parsing started
    assign ctl_flit_parse_din = flit_valid_s2_clone_dout;
    assign ctl_flit_parsed = ctl_flit_parse_dout;
    assign ctl_flit_parse_end_din = (flit_valid_s2_dout & (ctl_info_template_dout == 6'b0)) | (flit_valid_s4_dout & (ctl_info_template_dout == 6'b000011)) | (flit_valid_s5_dout & (ctl_info_template_dout == 6'b000001)) | flit_valid_s9_dout;
    assign ctl_flit_parse_end = ctl_flit_parse_end_dout;
    //t0 latch data
    assign flit_crc_s1_din = dlx_tlx_flit_crc_err; 
    assign flit_din[511:0] = (dlx_tlx_flit_valid && ~dlx_tlx_flit_crc_err) ? dlx_tlx_flit[511:0] : flit_dout[511:0];
    //Data Count
    assign data_nctl = (data_cnt_unverif_dout != 4'b0) ; //if asserted next flit is data, else flit is either null credit return or control flit
    assign data_cnt_unverif_din[3:0] =  (flit_crc_s1_dout) ? data_cnt_dout[3:0] : //if crc reset to verified count
                                        (flit_valid_s1_dout && (data_cnt_unverif_dout == 4'b0)) ? flit_dout[451:448] :
                                        (flit_valid_s1_dout && (data_cnt_unverif_dout > 4'b0)) ? (data_cnt_unverif_dout[3:0] - 4'b0001) : //decrement count
                                        data_cnt_unverif_dout[3:0];     //hold latch value
    assign data_cnt_din[3:0] = (flit_valid_s1_dout && (~data_nctl)) ? flit_dout[451:448] : data_cnt_dout[3:0]; //reset cnt to this value when receiving a crc error
    //Bookend detection
    assign true_bookend_din = (data_nctl) ? 1'b1  : 
                              (bookend_flit_valid_dout) ? 1'b0 : true_bookend_dout;
    assign bookend_flit_valid_din = flit_valid_s1_dout & ~data_nctl; 
    //Flit arbitration
    assign bdi_din = flit_valid_s1_dout ? flit_dout[459:452] : bdi_dout;
    assign ctl_flit_din[511:0] = (flit_valid_s2_din) ? flit_dout : ctl_flit_dout;
    assign data_flit_din[511:0] = ((data_nctl) && flit_valid_s1_dout) ? flit_dout : data_flit_dout;
    assign data_flit_valid_din = (data_nctl & flit_valid_s1_dout);
    assign run_length[3:0] = ((~data_nctl) && flit_valid_s1_dout) ? flit_dout[451:448] : 4'b0;
    //Credit return fast path
    assign credit_flag_din = (flit_valid_s1_dout & ~data_nctl) ; // pick up null credit return
    assign credit_buffer_din[55:0] = (flit_valid_s1_dout && ~data_nctl) ? flit_dout[55:0] : credit_buffer_dout[55:0];
    //Error Indicators
    assign bad_data_indicator[7:0] = bookend_flit_valid_dout && true_bookend_dout ? bdi_dout : 8'h00; //pass bad flit info to data fifo
    assign crc_error = (flit_crc_s1_dout & (data_nctl | true_bookend_din)); //Dump the data in holding fifo, when crc error is asserted during a frame
    assign bookend_flit_v = bookend_flit_valid_dout & true_bookend_dout; // Tells data arb to start pulling data from fifos
    //Parse data
    assign parse_block_null = flit_valid_s3_din |flit_valid_s4_din |flit_valid_s5_din |flit_valid_s6_din |flit_valid_s7_din |flit_valid_s8_din |flit_valid_s9_din;
    assign parse_inprog = flit_valid_s2_dout|flit_valid_s3_dout|flit_valid_s4_dout|flit_valid_s5_dout|flit_valid_s6_dout|flit_valid_s7_dout|flit_valid_s8_dout|flit_valid_s9_dout;
    assign pars_ctl_info_t0_din[167:0] = (flit_valid_s2_dout) ? ctl_flit_dout[279:112] : pars_ctl_info_t0_dout;
    assign pars_ctl_info_t1_din[111:0] = (flit_valid_s2_dout) ? ctl_flit_dout[111:0] : //parsing for template 1
                                         (flit_valid_s3_dout) ? ctl_flit_dout[223:112] :
                                         (flit_valid_s4_dout) ? ctl_flit_dout[335:224] :
                                         (flit_valid_s5_dout) ? ctl_flit_dout[447:336] : pars_ctl_info_t1_dout;
    assign pars_ctl_info_t2_din[55:0]  = (flit_valid_s2_dout) ? ctl_flit_dout[55:0] :
                                         (flit_valid_s3_dout) ? ctl_flit_dout[111:56] :
                                         (flit_valid_s4_dout) ? ctl_flit_dout[167:112] :
                                         (flit_valid_s5_dout) ? ctl_flit_dout[223:168] : 
                                         (flit_valid_s6_dout) ? ctl_flit_dout[279:224] :
                                         (flit_valid_s7_dout) ? ctl_flit_dout[335:280] :
                                         (flit_valid_s8_dout) ? ctl_flit_dout[391:336] :
                                         (flit_valid_s9_dout) ? ctl_flit_dout[447:392] : pars_ctl_info_t2_dout;
    assign pars_ctl_info_t3_din[167:0] = (flit_valid_s2_dout) ? {56'b0, ctl_flit_dout[111:0]} :
                                         (flit_valid_s3_dout) ? ctl_flit_dout[279:112] :
                                         (flit_valid_s4_dout) ? ctl_flit_dout[447:280] : pars_ctl_info_t3_dout;       
    //
    assign ctl_info_template_din[5:0] = (flit_valid_s2_din) ? flit_dout[465:460] : ctl_info_template_dout;
    assign ctl_info_template_s1_din[5:0] = ctl_info_template_dout;
    //assign outputs based on template
    assign pars_ctl_info = (ctl_info_template_s1_dout == 6'b000000) ? pars_ctl_info_t0_dout :
                           (ctl_info_template_s1_dout == 6'b000001) ? {56'b0,pars_ctl_info_t1_dout} :
                           (ctl_info_template_s1_dout == 6'b000010) ? {112'b0,pars_ctl_info_t2_dout} :
                           (ctl_info_template_s1_dout == 6'b000011) ? pars_ctl_info_t3_dout :
                           168'b0;
    assign ctl_template = ctl_info_template_s1_dout;                           
    assign pars_ctl_valid_din = parse_inprog;
    assign pars_ctl_valid = pars_ctl_valid_dout;
    assign credit_return = credit_buffer_dout;
    assign credit_return_v = credit_flag_dout & credit_buffer_dout[7:0] == 8'h01; //template 0 control flit return credit 
    assign pars_data_flit = data_flit_dout;
    assign pars_data_valid = data_flit_valid_dout;
    //Debug Error Signals 
    assign parser_inprog = flit_valid_s3_dout|flit_valid_s4_dout|flit_valid_s5_dout|flit_valid_s6_dout|flit_valid_s7_dout|flit_valid_s8_dout|flit_valid_s9_dout;
    assign template0_slot0_v = flit_valid_s2_dout & (ctl_info_template_dout == 6'b0);
    assign template0_slot0[27:0] = ctl_flit_dout[27:0];  
endmodule
