module aggregate(
	clk,
	ena,
	rst,
	doubleselect,  // control signal for double buffering
	start,
	idle,


	nump1, // number of vertex
	length1,
	length1_rdreq,
	length1_empty, 
	index1,
	index1_rdreq,
	index1_empty,
	value1,
	value1_rdreq,
	value1_empty,
	dst1,
	dst1_rdreq,
	dst1_empty,

	nump2,  // number of vertex
	length2,
	length2_rdreq,
	length2_empty,
	index2,
	index2_rdreq,
	index2_empty,
	value2,
	value2_rdreq,
	value2_empty,
	dst2,
	dst2_rdreq,
	dst2_empty,

	// signal for source buffer
	wea,
	datain,
	addressin,

	// signal for destination buffer
	dst_wea,
	dst_datain,
	dst_addressin,
	dst_in,


	dataout,
	addressout,
	stallforreaddst


);

parameter PWL=16;
parameter PIP=5;

parameter WL=32;
parameter NUM=128;


input clk, ena, rst, doubleselect, start, idle;
//output wire idle;

input [PWL - 1:0] nump1, nump2;

input [PWL - 1:0] length1, index1, dst1,  length2, index2, dst2;

input [WL- 1:0] value1, value2;

input length1_empty, index1_empty, value1_empty, dst1_empty;
input length2_empty, index2_empty, value2_empty, dst2_empty;

output reg length1_rdreq, index1_rdreq, value1_rdreq, dst1_rdreq;
output reg length2_rdreq, index2_rdreq, value2_rdreq, dst2_rdreq;


input dst_wea, dst_in;
input [WL*NUM -1:0]  dst_datain;
input [PWL - 1:0] dst_addressin;


// state machine to control the signal

input stallforreaddst;

parameter IDLE=3'd0, CAC=3'd1, DONE=3'd2;

reg [2:0] stateacc1, stateacc2;

reg [PWL - 1:0] length1_1, length2_2;

reg [PWL - 1:0] counter1, counter2;

reg [PWL - 1:0] subcounter1, subcounter2;

reg [PWL - 1:0] accaddress1, accaddress2;

reg [PWL - 1:0] dstaddress1, dstaddress2;

reg [WL -1:0] regvalue1, regvalue2, ret_regvalue1, ret_regvalue2;

reg acc1ena, acc2ena, acc1valid, acc2valid, acc1accum, acc2accum;


reg ret_acc1ena[3:0], ret_acc2ena[3:0], ret_acc1valid, ret_acc2valid, ret_acc1accum[3:0], ret_acc2accum[3:0];

reg ret_resourcesle1[3:0], ret_resourcesle2[3:0];

//************************* State machine for ACC1 *************************//

reg sourcesel1, sourcesel2;

wire [WL -1:0] dst_q_a, dst_q_b;

wire [WL*NUM -1:0]  acc1_to_q_a, acc2_to_q_a;


assign idle = (stateacc1 == IDLE) && (stateacc2 == IDLE);

reg [2:0] internal_status;

reg readlength1, readlength2;

reg [PWL - 1:0] dst_write1, dst_write2;

reg [4:0] accflash1, accflash2;



genvar j;

generate
	for(j = 1; j < 4; j = j + 1) begin
		always @(posedge clk) begin
			if (rst) begin
				ret_acc1accum[j] <= 1'b0;
				ret_acc2accum[j] <= 1'b0;
				ret_acc1ena[j] <= 1'b0;
				ret_acc2ena[j] <= 1'b0;
			end else begin
				ret_acc1accum[j] <= ret_acc1accum[j - 1];
				ret_acc2accum[j] <= ret_acc2accum[j - 1];
				ret_acc1ena[j] <= ret_acc1ena[j - 1];
				ret_acc2ena[j] <= ret_acc2ena[j - 1];
			end
		end
	end
endgenerate


generate
	for(j = 1; j < 4; j = j + 1) begin
		always @(posedge clk) begin
			if (rst) begin
				ret_resourcesle1[j] <= 1'b0;
				ret_resourcesle2[j] <= 1'b0;

			end else begin
				ret_resourcesle1[j] <= ret_resourcesle1[j - 1];
				ret_resourcesle2[j] <= ret_resourcesle2[j - 1];
			end
		end
	end
endgenerate



always @(posedge clk) begin
	if (rst) begin
		length1_1 <= 16'd0;
		length1_rdreq <=1'b0;
		counter1 <= 0;
		subcounter1 <=0;
		accaddress1 <=0;
		index1_rdreq <= 0;
		regvalue1 <= 0;
		value1_rdreq <= 0;
		acc1ena <= 0;
		acc1valid <= 0;
		acc1accum <=0;
		ret_acc1ena[0] <= 0;
		ret_acc1valid <= 0;
		ret_acc1accum[0] <= 0;
		ret_regvalue1 <= 0;
		dstaddress1 <= 0;
		sourcesel1 <= 0;
		dst1_rdreq <= 0;
		internal_status <= 3'b000;
		readlength1 <= 1'b0;
		ret_resourcesle1[0] <= 0;
		dst_write1 <= 0;
		accflash1 <= 0;
	end else begin
		ret_acc1ena[0] <= acc1ena;
		ret_acc1valid <= acc1valid;
		ret_acc1accum[0] <= acc1accum;
		ret_regvalue1 <= regvalue1;
		ret_resourcesle1[0] <= sourcesel1;
		case (stateacc1)
			IDLE: begin
				accflash1 <= 0;
				if (start) begin
					length1_1 <= 16'd0;
					length1_rdreq <=1'b0;
					counter1 <= 0;
					subcounter1 <=0;
					accaddress1 <=0;
					index1_rdreq <=0;
					regvalue1 <= 0;
					value1_rdreq <= 0;
					acc1ena <= 1'b0;
					acc1valid <= 0;
					acc1accum <= 0;
					dstaddress1 <= 0;
					sourcesel1 <= 0;
					dst1_rdreq <= 0;
					readlength1 <= 1'b0;
					dst_write1 <= 0;
				end else begin
					length1_1 <= 16'd0;
					length1_rdreq <=1'b0;
					counter1 <= 0;
					subcounter1 <=0;
					accaddress1 <= 0;
					index1_rdreq <= 0;
					regvalue1 <= 0;
					value1_rdreq <= 0;
					acc1ena <= 1'b0;
					acc1valid <= 0;
					acc1accum <= 0;
					dstaddress1 <= 0;
					sourcesel1 <= 0;
					dst1_rdreq <= 0;
					readlength1 <= 1'b0;
					dst_write1 <= 0;
				end				
			end
			CAC: begin
				accflash1 <= 0;
				case ({(length1_empty || dst1_empty || index1_empty || value1_empty || stallforreaddst), subcounter1 < length1})
					2'b00: begin  // is not empth and subcounter1 === length1_1
						if(readlength1 == 1'b0) begin
							length1_1 <= length1_1;
							length1_rdreq <=1'b1;
							readlength1 <= 1'b1;
							counter1 <= counter1;
							acc1ena <= 1'b0;
							dst1_rdreq <= 1'b1;
							subcounter1 <= subcounter1;		
							sourcesel1 <= 1'b0;
						end
						else begin
							length1_1 <= length1;
							length1_rdreq <=1'b0;
							readlength1 <= 1'b0;
							counter1 <= counter1 + 1;
							acc1ena <= 1'b1;
						    dst1_rdreq <= 1'b0;	
							subcounter1 <= 0;	
							sourcesel1 <= 1'b1; // select dst								
						end
						
						
						accaddress1 <= index1;
						index1_rdreq <= 0;
						regvalue1 <= value1;
						value1_rdreq <= 0;
						acc1accum <= 1'b0;
						acc1valid <= 1'b0;
						dstaddress1 <= dst1;
						internal_status <= 3'd1;	
						dst_write1 <= 0;
					end
					2'b01: begin // is not empth and subcounter1 < length1_1
						length1_1 <= length1_1;
						length1_rdreq <=1'b0;
						counter1 <= counter1;
						subcounter1 <= subcounter1+1;
						accaddress1 <= index1;
						index1_rdreq <= 1'b1;
						regvalue1 <= value1;
						value1_rdreq <= 1'b1;
						acc1ena <= 1'b1;
						if(subcounter1 == length1 - 1) begin
							acc1valid <= 1'b1;
							dst_write1 <= dst1;
						end
						else begin
							acc1valid <= 1'b0;
							dst_write1 <= 0;
						end
						acc1accum <= 1'b1;
						dstaddress1 <= dst1;
						sourcesel1 <= 1'b0; // select dst
						dst1_rdreq <= 1'b0;	
						internal_status <= 3'd2;
					end
					2'b10: begin // is empth and subcounter1 === length1_1
						length1_1 <= length1_1;
						length1_rdreq <=1'b0;
						counter1 <= counter1;
						subcounter1 <= subcounter1;
						accaddress1 <= index1;
						index1_rdreq <= 0;
						regvalue1 <= value1;
						value1_rdreq <= 0;
						acc1ena <= 1'b0;
						acc1valid <= 1'b0;
						acc1accum <= 1'b0;
						dstaddress1 <= dst1;
						sourcesel1 <= sourcesel1; // select dst
						dst1_rdreq <= 1'b0;	
						internal_status <= 3'd3;
						dst_write1 <= 0;
					end
					2'b11: begin // is empth and subcounter1 < length1_1
						if ((index1_empty || value1_empty)==1'b1) begin
							length1_1 <= length1_1;
							length1_rdreq <=1'b0;
							counter1 <= counter1;
							subcounter1 <= subcounter1;
							accaddress1 <= accaddress1;
							index1_rdreq <= 0;
							regvalue1 <= 0;
							value1_rdreq <= 0;
							acc1ena <= 1'b0;
							acc1valid <= acc1valid;
							acc1accum <= 1'b0;
							dstaddress1 <= dst1;
							sourcesel1 <= sourcesel1; // select dst
							dst1_rdreq <= 1'b0;	
							internal_status <= 3'd4;
							dst_write1 <= acc1valid;
						end 
						else begin
							length1_1 <= length1_1;
							length1_rdreq <=1'b0;
							counter1 <= counter1;
							subcounter1 <= subcounter1+1;
							accaddress1 <= index1;
							index1_rdreq <= 1'b1;
							regvalue1 <= value1;
							value1_rdreq <= 1'b1;
							acc1ena <= 1'b1;
							if(subcounter1 == length1_1 - 1) begin
								acc1valid <= 1'b1;
								dst_write1 <= dst1;
							end
							else begin
								acc1valid <= 1'b0;
								dst_write1 <= 0;
							end
							acc1accum <= 1'b1;
							dstaddress1 <= dst1;
							sourcesel1 <= 1'b0; // select dst
							dst1_rdreq <= 1'b0;	
							internal_status <= 3'd5;
						end
					end
					default: begin
						length1_1 <= length1_1;
						length1_rdreq <= length1_rdreq;
						counter1 <= counter1;
						subcounter1 <= subcounter1;
						accaddress1 <= accaddress1;
						index1_rdreq <= 0;
						regvalue1 <= 0;
						value1_rdreq <= 0;
						acc1ena <= 1'b0;
						acc1valid <= 1'b0;
						dst_write1 <= 0;
						acc1accum <= 1'b0;
						dstaddress1 <= dst1;
						sourcesel1 <= 1'b0; // select dst
						dst1_rdreq <= 1'b0;	
						internal_status <= 3'd6;
					end
				endcase
			end
			DONE: begin
				if (accflash1 == 5'd12) 
				begin
					acc1ena <= 1'b0;
					accflash1 <= 0;
				end	
				else begin
					acc1ena <= 1'b1;
					accflash1 <= accflash1 + 1;
				end
				length1_1 <= 0;
				length1_rdreq <= 0;
				counter1 <= 0;
				subcounter1 <= 0;
				accaddress1 <= 0;
				index1_rdreq <= 0;
				regvalue1 <= 0;
				value1_rdreq <= 0;
				acc1valid <= 1'b0;
				dst_write1 <= 0;
				acc1accum <= 1'b0;
				dstaddress1 <= 0;
				sourcesel1 <= 1'b0; // select dst
				dst1_rdreq <= 1'b0;	
			end
			default: begin
				accflash1 <= 0;
				length1_1 <= 0;
				length1_rdreq <= 0;
				counter1 <= 0;
				subcounter1 <= 0;
				accaddress1 <= 0;
				index1_rdreq <= 0;
				regvalue1 <= 0;
				value1_rdreq <= 0;
				acc1ena <= 1'b0;
				acc1valid <= 1'b0;
				dst_write1 <= 0;
				acc1accum <= 1'b0;
				dstaddress1 <= 0;
				sourcesel1 <= 1'b0; // select dst
				dst1_rdreq <= 1'b0;
			end
		endcase
	end
	
end

//************************* State machine for ACC2 *************************//

always @(posedge clk) begin
	if (rst) begin
		length2_2 <= 16'd0;
		length2_rdreq <=1'b0;
		counter2 <= 0;
		subcounter2 <=0;
		accaddress2 <=0;
		index2_rdreq <= 0;
		regvalue2 <= 0;
		value2_rdreq <= 0;
		acc2ena <= 0;
		acc2valid <= 0;
		acc2accum <=0;
		ret_acc2ena[0] <= 0;
		ret_acc2valid <= 0;
		ret_acc2accum[0] <= 0;
		ret_regvalue2 <= 0;
		dstaddress2 <= 0;
		sourcesel2 <= 0;
		dst2_rdreq <= 0;
		readlength2 <= 1'b0;
		ret_resourcesle2[0] <= 0;
		dst_write2 <= 0;
		accflash2 <= 0;
	end else begin
		ret_acc2ena[0] <= acc2ena;
		ret_acc2valid <= acc2valid;
		ret_acc2accum[0] <= acc2accum;
		ret_regvalue2 <= regvalue2;
		ret_resourcesle2[0] <= sourcesel2;
		case (stateacc2)
			IDLE: begin
				accflash2 <= 0;
				if (start) begin
					length2_2 <= 16'd0;
					length2_rdreq <=1'b0;
					counter2 <= 0;
					subcounter2 <=0;
					accaddress2 <=0;
					index2_rdreq <=0;
					regvalue2 <= 0;
					value2_rdreq <= 0;
					acc2ena <= 1'b0;
					acc2valid <= 0;
					acc2accum <= 0;
					dstaddress2 <= 0;
					sourcesel2 <= 0;
					dst2_rdreq <= 0;
					readlength2 <= 1'b0;
					dst_write2 <= 0;
				end else begin
					length2_2 <= 16'd0;
					length2_rdreq <=1'b0;
					counter2 <= 0;
					subcounter2 <=0;
					accaddress2 <= 0;
					index2_rdreq <= 0;
					regvalue2 <= 0;
					value2_rdreq <= 0;
					acc2ena <= 1'b0;
					acc2valid <= 0;
					acc2accum <= 0;
					dstaddress2 <= 0;
					sourcesel2 <= 0;
					dst2_rdreq <= 0;
					readlength2 <= 1'b0;
					dst_write2 <= 0;
				end				
			end
			CAC: begin
				accflash2 <= 0;
				case ({(length2_empty || dst2_empty || index2_empty || value2_empty || stallforreaddst), subcounter2 < length2})
					2'b00: begin  // is not empth and subcounter1 === length1_1
						if(readlength2 == 1'b0) begin
							length2_2 <= length2_2;
							length2_rdreq <=1'b1;
							readlength2 <= 1'b1;
							counter2 <= counter2;
							acc2ena <= 1'b0;
							dst2_rdreq <= 1'b1;
							subcounter2 <= subcounter2;		
							sourcesel2 <= 1'b0;
						end
						else begin
							length2_2 <= length2;
							length2_rdreq <=1'b0;
							readlength2 <= 1'b0;
							counter2 <= counter2 + 1;
							acc2ena <= 1'b1;
						    dst2_rdreq <= 1'b0;	
							subcounter2 <= 0;	
							sourcesel2 <= 1'b1; // select dst								
						end
						
						
						accaddress2 <= index2;
						index2_rdreq <= 0;
						regvalue2 <= value2;
						value2_rdreq <= 0;
						acc2accum <= 1'b0;
						acc2valid <= 1'b0;
						dstaddress2 <= dst2;
						dst_write2 <= 0;
					end
					2'b01: begin // is not empth and subcounter1 < length1_1
						length2_2 <= length2_2;
						length2_rdreq <=1'b0;
						counter2 <= counter2;
						subcounter2 <= subcounter2+1;
						accaddress2 <= index2;
						index2_rdreq <= 1'b1;
						regvalue2 <= value2;
						value2_rdreq <= 1'b1;
						acc2ena <= 1'b1;
						if(subcounter2 == length2 - 1) begin
							acc2valid <= 1'b1;
							dst_write2 <= dst2;
						end
						else begin
							acc2valid <= 1'b0;
							dst_write2 <= 0;
						end
						acc2accum <= 1'b1;
						dstaddress2 <= dst2;
						sourcesel2 <= 1'b0; // select dst
						dst2_rdreq <= 1'b0;	
					end
					2'b10: begin // is empth and subcounter1 === length1_1
						length2_2 <= length2_2;
						length2_rdreq <=1'b0;
						counter2 <= counter2;
						subcounter2 <= subcounter2;
						accaddress2 <= index2;
						index2_rdreq <= 0;
						regvalue2 <= value2;
						value2_rdreq <= 0;
						acc2ena <= 1'b0;
						acc2valid <= 1'b0;
						acc2accum <= 1'b0;
						dstaddress2 <= dst2;
						sourcesel2 <= sourcesel2; // select dst
						dst2_rdreq <= 1'b0;	
						dst_write2 <= 0;
					end
					2'b11: begin // is empth and subcounter1 < length1_1
						if ((index2_empty || value2_empty)==1'b1) begin
							length2_2 <= length2_2;
							length2_rdreq <=1'b0;
							counter2 <= counter2;
							subcounter2 <= subcounter2;
							accaddress2 <= accaddress2;
							index2_rdreq <= 0;
							regvalue2 <= 0;
							value2_rdreq <= 0;
							acc2ena <= 1'b0;
							acc2valid <= acc2valid;
							acc2accum <= 1'b0;
							dstaddress2 <= dst2;
							sourcesel2 <= sourcesel2; // select dst
							dst2_rdreq <= 1'b0;	
							dst_write2 <= acc2valid;
						end 
						else begin
							length2_2 <= length2_2;
							length2_rdreq <=1'b0;
							counter2 <= counter2;
							subcounter2 <= subcounter2+1;
							accaddress2 <= index2;
							index2_rdreq <= 1'b1;
							regvalue2 <= value2;
							value2_rdreq <= 1'b1;
							acc2ena <= 1'b1;
							if(subcounter2 == length2_2 - 1) begin
								acc2valid <= 1'b1;
								dst_write2 <= dst2;
							end
							else begin
								acc2valid <= 1'b0;
								dst_write2 <= 0;
							end
							acc2accum <= 1'b1;
							dstaddress2 <= dst2;
							sourcesel2 <= 1'b0; // select dst
							dst2_rdreq <= 1'b0;	

						end
					end
					default: begin
						length2_2 <= length2_2;
						length2_rdreq <= length2_rdreq;
						counter2 <= counter2;
						subcounter2 <= subcounter2;
						accaddress2 <= accaddress2;
						index2_rdreq <= 0;
						regvalue2 <= 0;
						value2_rdreq <= 0;
						acc2ena <= 1'b0;
						acc2valid <= 1'b0;
						dst_write2 <= 0;
						acc2accum <= 1'b0;
						dstaddress2 <= dst2;
						sourcesel2 <= 1'b0; // select dst
						dst2_rdreq <= 1'b0;	
					end
				endcase
			end
			DONE: begin
				if (accflash2 == 5'd12) 
				begin
					acc2ena <= 1'b0;
					accflash2 <= 0;
				end	
				else begin
					acc2ena <= 1'b1;
					accflash2 <= accflash2 + 1;
				end
				length2_2 <= 0;
				length2_rdreq <= 0;
				counter2 <= 0;
				subcounter2 <= 0;
				accaddress2 <= 0;
				index2_rdreq <= 0;
				regvalue2 <= 0;
				value2_rdreq <= 0;
				acc2ena <= 1'b0;
				acc2valid <= 1'b0;
				dst_write2 <= 0;
				acc2accum <= 1'b0;
				dstaddress2 <= 0;
				sourcesel2 <= 1'b0; // select dst
				dst2_rdreq <= 1'b0;	
			end
			default: begin
				length2_2 <= 0;
				length2_rdreq <= 0;
				counter2 <= 0;
				subcounter2 <= 0;
				accaddress2 <= 0;
				index2_rdreq <= 0;
				regvalue2 <= 0;
				value2_rdreq <= 0;
				acc2ena <= 1'b0;
				acc2valid <= 1'b0;
				dst_write2 <= 0;
				acc2accum <= 1'b0;
				dstaddress2 <= 0;
				sourcesel2 <= 1'b0; // select dst
				dst2_rdreq <= 1'b0;	
			end
		endcase
	end
	
end

// next state logic



always @(posedge clk) begin
	if (rst) begin
		stateacc1 <= IDLE;
	end else begin
		case (stateacc1)
			IDLE: begin
				  if (start) begin
					  stateacc1 <= CAC;
				  end else begin
					  stateacc1 <= IDLE;
				  end			
			end
			CAC: begin
				if ((counter1 == nump1) && (subcounter1 == length1)) begin
					stateacc1 <= DONE;
				end else begin
					stateacc1 <= CAC;
				end
			end		
			DONE: begin
				if (accflash1 == 5'd12) begin
					stateacc1 <= IDLE;
				end else begin
				    stateacc1 <= DONE;
				end
			end	
			default: begin
				stateacc1 <= IDLE;
			end
		endcase
	end
end 




always @(posedge clk) begin
	if (rst) begin
		stateacc2 <= IDLE;
	end else begin
		case (stateacc2)
			IDLE: begin
				  if (start) begin
					  stateacc2 <= CAC;
				  end else begin
					  stateacc2 <= IDLE;
				  end			
			end
			CAC: begin
				if ((counter2 == nump2) && (subcounter2 == length2)) begin
					stateacc2 <= DONE;
				end else begin
					stateacc2 <= CAC;
				end
			end		
			DONE: begin
				if (accflash2 == 5'd12) begin
					stateacc2 <= IDLE;
				end else begin
				    stateacc2 <= DONE;
				end
			end	
			default: begin
				stateacc2 <= IDLE;
			end
		endcase
	end
end 




reg validacc1[3:0], validacc2[3:0];


reg validacc1_pip[PIP - 1:0], validacc2_pip[PIP - 1:0];


reg [PWL - 1:0] dst_write1_tmp1[3:0], dst_write2_tmp1[3:0];

reg [PWL - 1:0] dst_write1_tmp2[PIP - 1:0], dst_write2_tmp2[PIP - 1:0];

reg [WL - 1:0] ret_value1[1:0], ret_value2[1:0];



always @(posedge clk) begin
	if (rst) begin
		validacc1[0] <= 1'b0;
		dst_write1_tmp1[0] <= 0;
		ret_value1[0] <= 0;
	end else begin
		validacc1[0] <= acc1valid;
		dst_write1_tmp1[0] <= dst_write1;
		ret_value1[0] <= regvalue1;
	end
end


always @(posedge clk) begin
	if (rst) begin
		validacc2[0] <= 1'b0;
		dst_write2_tmp1[0] <= 0;
		ret_value2[0] <= 0;
	end else begin
		validacc2[0] <= acc2valid;
		dst_write2_tmp1[0] <= dst_write2;
		ret_value2[0] <= regvalue2;
	end
end


genvar i;


generate
	for(i = 1; i < 2; i = i + 1) begin
		always @(posedge clk) begin
			if (rst) begin
				ret_value1[i] <= 1'b0;
				ret_value2[i] <= 1'b0;
			end else begin
				ret_value1[i] <= ret_value1[i-1];
				ret_value2[i] <= ret_value2[i-1];
			end
		end
	end
endgenerate




generate
	for(i = 1; i < 4; i = i + 1) begin
		always @(posedge clk) begin
			if (rst) begin
				validacc1[i] <= 1'b0;
				dst_write1_tmp1[i] <= 1'b0;
			end else begin
				validacc1[i] <= validacc1[i - 1];
				dst_write1_tmp1[i] <= dst_write1_tmp1[i-1];
			end
		end
	end
endgenerate


generate
	for(i = 1; i < 4; i = i + 1) begin
		always @(posedge clk) begin
			if (rst) begin
				validacc2[i] <= 1'b0;
				dst_write2_tmp1[i] <= 1'b0;
			end else begin
				validacc2[i] <= validacc2[i - 1];
				dst_write2_tmp1[i] <= dst_write2_tmp1[i-1];
			end
		end
	end
endgenerate


always @(posedge clk) begin
	if (rst) begin
		validacc1_pip[0] <= 1'b0;
		dst_write1_tmp2[0] <= 1'b0;
	end else begin
		if (ret_acc1ena[3]) begin
			validacc1_pip[0] <= validacc1[3];
			dst_write1_tmp2[0] <= dst_write1_tmp1[3];
		end
		else begin
		  	validacc1_pip[0] <= validacc1_pip[0];
			dst_write1_tmp2[0] <= dst_write1_tmp2[0];
		end
		
	end
end


always @(posedge clk) begin
	if (rst) begin
		validacc2_pip[0] <= 1'b0;
		dst_write2_tmp2[0] <= 1'b0;
	end else begin
		if (ret_acc2ena[3]) begin
			validacc2_pip[0] <= validacc2[3];
			dst_write2_tmp2[0] <= dst_write2_tmp1[3];
		end
		else begin
		  	validacc2_pip[0] <= validacc2_pip[0];
			dst_write2_tmp2[0] <= dst_write2_tmp2[0];
		end
		
	end
end


generate
	for(i = 1; i < PIP; i = i + 1) begin
		always @(posedge clk) begin
			if (rst) begin
				validacc1_pip[i] <= 1'b0;
				dst_write1_tmp2[i] <= 1'b0;
			end else begin
				if (ret_acc1ena[3]) begin
					validacc1_pip[i] <= validacc1_pip[i - 1];
					dst_write1_tmp2[i] <= dst_write1_tmp2[i - 1];
				end
				else begin
				  	validacc1_pip[i] <= validacc1_pip[i];
					dst_write1_tmp2[i] <= dst_write1_tmp2[i];  
				end
			end
		end
	end
endgenerate

generate
	for(i = 1; i < PIP; i = i + 1) begin
		always @(posedge clk) begin
			if (rst) begin
				validacc2_pip[i] <= 1'b0;
				dst_write2_tmp2[i] <= 1'b0;
			end else begin
				if (ret_acc2ena[3]) begin
					validacc2_pip[i] <= validacc2_pip[i - 1];
					dst_write2_tmp2[i] <= dst_write2_tmp2[i - 1];
				end
				else begin
				  	validacc2_pip[i] <= validacc2_pip[i];
					dst_write2_tmp2[i] <= dst_write2_tmp2[i];  
				end
			end
		end
	end
endgenerate

// generate
// 	for(i = 1; i < PIP; i = i + 1) begin
// 		always @(posedge clk) begin
// 			if (rst) begin
// 				validacc2[i] <= 1'b0;
// 			end else begin
// 				if (ret_acc2ena[0]) begin
// 					validacc2[i] <= validacc2[i - 1];
// 				end else begin
// 					validacc2[i] <= validacc2[i];
// 				end
// 			end
// 		end
// 	end
// endgenerate


input wea;
input [WL*NUM- 1:0] datain;
input [PWL -1 :0] addressin;

//input rea;
output wire [WL*NUM- 1:0] dataout;


input [PWL -1 :0] addressout;

wire [WL*NUM- 1:0] q_a_to_acc1, q_a_to_acc2;



vertexbuffer sourcebufferins (
	.data_a          (4096'd0),          //   input,  width = 4096,          data_a.datain_a
	.q_a             (q_a_to_acc1),             //  output,  width = 4096,             q_a.dataout_a
	.data_b          (datain),          //   input,  width = 4096,          data_b.datain_b
	.q_b             (q_a_to_acc2),             //  output,  width = 4096,             q_b.dataout_b
	.write_address_a ({doubleselect, 10'd0}), //   input,    width = 10, write_address_a.write_address_a
	.write_address_b ({doubleselect, addressin[9:0]}), //   input,    width = 10, write_address_b.write_address_b
	.read_address_a  ({doubleselect, accaddress1[9:0]}),  //   input,    width = 10,  read_address_a.read_address_a
	.read_address_b  ({doubleselect, accaddress2[9:0]}),  //   input,    width = 10,  read_address_b.read_address_b
	.wren_a          (1'b0),          //   input,     width = 1,          wren_a.wren_a
	.wren_b          (wea),          //   input,     width = 1,          wren_b.wren_b
	.clock           (clk)            //   input,     width = 1,           clock.clk
);




accarray accins1 (
	.clk(clk),
	.ena(ret_acc1ena[3]),
	.clr(rst),
	.accumulate(ret_acc1accum[3]),
	.feature(ret_resourcesle1[3]? dst_q_a:q_a_to_acc1),
	.value(ret_resourcesle1[3]? 32'b00111111100000000000000000000000:ret_value1[1]),
	.result(acc1_to_q_a)
);




accarray accins2 (
	.clk(clk),
	.ena(ret_acc2ena[3]),
	.clr(rst),
	.accumulate(ret_acc2accum[3]),
	.feature(ret_resourcesle2[3]? dst_q_b:q_a_to_acc2),
	.value(ret_resourcesle2[3]? 32'b00111111100000000000000000000000:ret_value2[1]),
	.result(acc2_to_q_a)
);


vertexbuffer destinationbufferins (
	.data_a          (dst_in?dst_datain:acc1_to_q_a),          //   input,  width = 4096,          data_a.datain_a
	.q_a             (dst_q_a),             //  output,  width = 4096,             q_a.dataout_a
	.data_b          (acc2_to_q_a),          //   input,  width = 4096,          data_b.datain_b
	.q_b             (dst_q_b),             //  output,  width = 4096,             q_b.dataout_b
	.write_address_a ({doubleselect, dst_in?dst_addressin[9:0]:dst_write1_tmp2[4][9:0]}), //   input,    width = 10, write_address_a.write_address_a  accoutaddress1[9:0]
	.write_address_b ({doubleselect, dst_write2_tmp2[4][9:0]}), //   input,    width = 10, write_address_b.write_address_b  accoutaddress2[9:0]
	.read_address_a  ({doubleselect, dstaddress1[9:0]}),  //   input,    width = 10,  read_address_a.read_address_a
	.read_address_b  ({doubleselect, stallforreaddst? dstaddress2[9:0]:addressout}),  //   input,    width = 10,  read_address_b.read_address_b
	.wren_a          (dst_in?dst_wea:validacc1_pip[4]),          //   input,     width = 1,          wren_a.wren_a
	.wren_b          (validacc2_pip[4]),          //   input,     width = 1,          wren_b.wren_b
	.clock           (clk)            //   input,     width = 1,           clock.clk
);


assign dataout = dst_q_b;




endmodule