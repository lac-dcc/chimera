// This program was cloned from: https://github.com/VeriGOOD-ML/public
// License: Apache License 2.0

//
//      verilog template for controller in Axiline
//

`include "config.vh"
module controller#(
    parameter logNumCycle=3,
    parameter numCycle=8,
	parameter instBitwidth=3
)(
    input clk,
    input start,done,
    input rst,

    output [instBitwidth-1:0]inst,
	output reg sel,
    //output w1_sel,w2_sel,
    //output x1_en,w1_en,
    output [logNumCycle-1:0]xw1_addr,
    //output x2_en,w2_en,
    output [logNumCycle-1:0]xw2_addr

);
    reg [logNumCycle-1:0] counter;
	reg [logNumCycle-1:0] sgd_counter; 
    localparam IDLE=3'd0, INIT=3'd1, INIT_IP=3'd2,IP=3'd3,COMB=3'd4,PIPE=3'd5,SGD=3'd6;
    reg[2:0]state;
	//reg sel;

    always @(posedge clk or posedge rst)begin
        if(rst) begin
            state<=IDLE;
            counter<=0;
            sgd_counter<=0;
        end else  begin
            case (state)
            IDLE:begin
                if(start) begin
                    state<=INIT;
                    counter<=0;
                    sgd_counter<=0;
                end else begin
                    state<=IDLE;
                    counter<=0;
                    sgd_counter<=0;
                end
            end

            INIT: begin
                if(counter==numCycle-1) begin
  					counter<=0;
					state<=INIT_IP;
                end else begin
                    counter<=counter+1;
                    state<=INIT; 
                end
            end

            INIT_IP: begin
                if(counter==numCycle-1) begin
  					counter<=0;
					state<=COMB;
                end else begin
                    counter<=counter+1;
                    state<=INIT_IP; 
                end
            end

            IP: begin
                if(counter==numCycle-1) begin
  					counter<=0;
					state<=COMB;
                end else begin
                    counter<=counter+1;
                    state<=IP; 
                end
            end
			 
            COMB: begin
					state<=SGD;
            end

            SGD: begin  
                if(done) begin
                    if (sgd_counter==numCycle-1) begin
                        sgd_counter<=sgd_counter+1;
                        state<=SGD;
                    end else begin
                        sgd_counter<=0;
                        state<=IDLE;
                    end
                end else begin
                    sgd_counter<=sgd_counter+1;
                    state<=PIPE; 
                end
            end

            PIPE: begin
                if(sgd_counter==numCycle-1) begin
  					sgd_counter<=0;
					counter<=counter+1;
                    state<=IP;
                end else begin
                    counter<=counter+1;
                    sgd_counter<=sgd_counter+1;
                    state<=PIPE; 
                end
            end
            endcase
        end
    end

    // control logic based on state machine
    // input ena
    /* wire in_ea, w_ea, bmr_ea;,out_rd
    assign sel= ((state==IP|state==PIPE)&counter!=0)?1'b1:1'b0;
    assign w_ea = state==INIT;
    assign in_ea = (state==INIT|state==IP|state==PIPE);
    assign bmr_ea = (state==COMB);
    assign out_rd = (state==SGD|state==PIPE);

    assign inst={out_rd,bmr_ea,in_ea,w_ea,sel}; */
 	/*     //init ip
    assign w1_sel=state==INIT;
    assign w2_sel=state==INIT_IP;

    // memory ena
    assign x1_en=(state==IP|state==INIT_IP|state==PIPE);
    assign x2_en=(state==SGD|state==PIPE);

    assign w1_en=(state==INIT|state==IP|state==PIPE);
    assign w2_e=(state==INIT_IP|state==PIPE); */


	// memory ena no delay
    //assign x1_en=(state==IP|state==INIT_IP|state==PIPE);
    //assign x2_en=(state==SGD|state==PIPE);

    //assign w1_en=(state==INIT|state==IP|state==PIPE);
    //assign w2_en=((state==INIT_IP&xw1_addr!=numCycle-1)|state==PIPE|(state==INIT&xw1_addr==numCycle-1));
	// others 1-cycle delay
	//wire [logNumCycle-1:0]xw1_addr_pre,xw2_addr_pre;
	//wire [2:0]inst_pre;
	assign inst=state;
    assign xw1_addr=counter;
    assign xw2_addr=sgd_counter;

	/*always @(posedge clk)begin
			if (rst)begin 
				inst<=0;
				xw2_addr<=0;
				xw1_addr<=0;
			end else begin 
				inst<=inst_pre;
				xw2_addr<=xw2_addr_pre;
				xw1_addr<=xw1_addr_pre;
			end
		end*/
	wire sel_pre;
	assign sel_pre= (state==IP|state==INIT_IP|state==PIPE)&counter!=0;
	always @(posedge clk)begin
				if (rst)begin 
					sel<=0;
				end else begin 
					sel<=sel_pre;
				end
			end
endmodule

