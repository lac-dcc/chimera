`timescale 1ns/1ps
`ifdef FPGA
	`include "inst.vh"
	`include "config.vh"
`endif
module pe_compute
#(  //--------------------------------------------------------------------------------------
	parameter peId = 0,
	parameter puId = 0,
    parameter integer memDataLen = 16,
    parameter integer dataLen = 16,
    parameter integer logNumFn = 3
    //--------------------------------------------------------------------------------------
) ( //--------------------------------------------------------------------------------------
	input  wire 					clk,
	input  wire 					rstn,
    input  signed [dataLen  - 1 : 0 ] operand1,
    input  signed [dataLen  - 1 : 0 ] operand2,
    input stall,
    
    input  wire [logNumFn - 1 : 0 ] fn,
    output reg  [dataLen  - 1 : 0 ] result
);  //--------------------------------------------------------------------------------------
	
	reg  [dataLen  - 1 : 0 ] resultOut;
	reg stall_d;
	
	always @(posedge clk or negedge rstn)
	   if(~rstn) begin
	       result <= {dataLen{1'b0}};
	       stall_d <= 1'b0;
	   end
	   else begin
	       result <= stall ? result : resultOut;
	       stall_d <= stall;
	   end
	
	reg done;
	wire operand1_v,operand2_v;
    wire signed [dataLen  - 1 : 0 ] input1,input2;
    assign input1 = $signed(operand1);
    assign input2 = $signed(operand2);
    //--------------------------------------------------------------------------------------
    wire[dataLen - 1 : 0]   immDiv;
    genvar i;
    `ifdef DIV
    generate
    	if(peId == 0 && puId == 0) begin
    		divider #(
        		.dataLen    ( dataLen       )
   	 		)
     		div_unit (
        		.in1        ( operand1      ),
        		.in2        ( operand2      ),
        		.out        ( immDiv        )
    		);
    	end
    endgenerate
    `else
    assign immDiv = 0;
    `endif
    //--------------------------------------------------------------------------------------
    
    //--------------------------------------------------------------------------------------
    wire[16 - 1 : 0]   immSig;
    wire[31 : 0]   immOperand1;
    
    assign immOperand1 = {{(32-dataLen){1'b0}}, operand1};
    
    `ifdef SIGMOID
    sigmoid #(
        .dataLen    ( 16  )
    ) sig_unit ( 
        .in         (operand1[16-1:0] ),
        .out        ( immSig  )
    );
    
    `else
    assign immSig = 0;
    `endif
    
    //--------------------------------------------------------------------------------------

    //--------------------------------------------------------------------------------------
    wire[dataLen - 1 : 0]   immSqrt;
    wire sqrtDone;
    assign immSqrt[dataLen - 1 : dataLen/2] = 0;
    
    // `ifdef SQRT
    // generate
    	// if(peId == 0 && puId == 0) begin 
    		// sqrt #(
        		// .inLen      ( dataLen       )
    		// ) sqrt_unit (
        		// .in         ( operand1      ),
        		// .out        ( immSqrt[dataLen/2 - 1 : 0]),
        		// .rout		(				),
        		// .done       ( sqrtDone      )
    		// );
        // end
    // endgenerate
    // `else
    assign immSqrt[dataLen/2 - 1 : 0] = 0;
    // `endif
    
    //--------------------------------------------------------------------------------------
    
    //--------------------------------------------------------------------------------------
    wire[dataLen - 1 : 0]   immGau;
    
    `ifdef GAUSSIAN
    gaussian #(
        .dataLen    ( dataLen       )
    ) g_unit (
        .in1        ( operand1      ),
        .out        ( immGau        )
    );
    `else
    assign immGau = 0;
    `endif
    //--------------------------------------------------------------------------------------
    wire [dataLen+memDataLen-1:0] mult_out;
    reg [2*dataLen-1:0] sum_out;
    wire [dataLen:0] addsub;
    
    assign addsub[dataLen:0] = fn[0] ? input1 + input2 : input1 - input2 ;
    
  
    always @(*) begin
        sum_out[2*dataLen-1:dataLen+1] = {dataLen-1{addsub[dataLen]}};
        case(addsub[dataLen:dataLen-1])
            2'b01 : begin
                sum_out[dataLen] = 1'b0;
                sum_out[dataLen-1:0] = {dataLen{1'b1}};
            end
            2'b10 : begin
                sum_out[dataLen] = 1'b1;
                sum_out[dataLen-1:0] = {dataLen{1'b0}};
            end
            default : begin
                sum_out[dataLen] = addsub[dataLen];
                sum_out[dataLen-1:0] = addsub[dataLen-1:0];
            end
        endcase
    end
    assign mult_out = $signed(input1[memDataLen-1:0]) * input2;
    always @(*) begin
        case(fn)
            5'd1: begin
                resultOut = input1 + input2;
                done      = operand1_v && operand2_v;
             end
             5'd2: begin
                resultOut = input1 - input2;
                done      = operand1_v && operand2_v;
             end
             5'd3: begin
//                resultOut = mult_out[(dataLen+memDataLen-1) -: dataLen];
                resultOut = mult_out[dataLen-1:0];
                done      = operand1_v && operand2_v;
             end
             5'd4: begin
                resultOut = immDiv;
                done      = operand1_v && operand2_v;
             end
             5'd5: begin
                resultOut = input1 < input2;
                done      = operand1_v && operand2_v;
             end
             5'd6: begin
                resultOut = input1 <= input2;
                done      = operand1_v && operand2_v;
             end
             5'd7: begin
                resultOut = input1 > input2;
                done      = operand1_v && operand2_v;
             end
             5'd8: begin
                resultOut = input1 >= input2;
                done      = operand1_v && operand2_v;
             end
             5'd9: begin
                resultOut = input1 == input2;
                done      = operand1_v && operand2_v;
             end
             5'd10: begin
                resultOut = input1 != input2;
                done      = operand1_v && operand2_v;
             end
             
             5'd16: begin
                resultOut = {7'b0,immSig[15 - 1 : 7]};
                done      = operand1_v ;
             end
             5'd17: begin
                resultOut = immGau;
                done      = operand1_v ;
             end
             5'd18: begin
                resultOut = immSqrt;
                done      = sqrtDone && operand1_v ;
             end
             
             5'd24: begin
                resultOut = input1;
                done      = operand1_v ;
             end
             
             5'd17: begin
                resultOut = immGau;
                done      = operand1_v ;
             end
             default: begin
                resultOut = input1;
                done      =  operand1_v;
             end
          endcase
      end
 
   // end

endmodule
