// This program was cloned from: https://github.com/eda-lab/CNNAF-CNN-Accelerator_init
// License: MIT License

module bias_add(
    input                       clk_100M,
    input                       rst_n,
    
    input                       data_in_vld,
    input [511:0]               data_in,
    input [511:0]               bias_in,
    
    output                      data_out_vld,
    output [511:0]              data_out
);

//-------------------------------------------
// regs & wires & parameters
//-------------------------------------------
wire [31:0]                     bias_in_part[15:0];
wire [31:0]                     data_in_part[15:0];
genvar i;

//-------------------------------------------
// split data
//-------------------------------------------

generate
    for(i = 0; i < 16; i = i + 1) begin : data_divide
        assign bias_in_part[i] = bias_in[i*32+31 : i*32];
        assign data_in_part[i] = data_in[i*32+31 : i*32];
    end
endgenerate

//-------------------------------------------
// add bias and the output data from calc_unit
//-------------------------------------------
wire [31:0]                     add_out[15:0];
generate
    for(i = 0; i < 16; i = i + 1) begin : data_add
        fp_add_bias fp_add_bias(
            .clk                (clk_100M),         
            .areset             (~rst_n),           
            .a                  (bias_in_part[i]),  
            .b                  (data_in_part[i]),  
            .q                  (add_out[i])        
        );
    end
endgenerate
//-------------------------------------------
// ReLU6 
//-------------------------------------------
wire                            less_than_6[15:0];
generate
    for(i = 0; i < 16; i = i + 1) begin : less_6_gen
        fp_cmp_bias fp_cmp_bias(
            .clk                (clk_100M),    
            .areset             (~rst_n), 
            .a                  (add_out[i]),      
            .b                  (32'h40C00000),      //6
            .q                  (less_than_6[i])  
        );
    end
endgenerate

reg                             less_than_0[15:0];
generate
    for(i = 0; i < 16; i = i + 1) begin : less_0_gen
        always @ (posedge clk_100M or negedge rst_n)
        begin
            if(!rst_n) begin
                less_than_0[i] <= 1'b0;
            end
            else if (add_out[i][31] == 1'b1) begin
                less_than_0[i] <= 1'b1;
            end
            else begin
                less_than_0[i] <= 1'b0;
            end
        end
    end
endgenerate

reg [31:0]                      add_out_temp[15:0];
generate
    for(i = 0; i < 16; i = i + 1) begin : add_out_temp_gen
        always @ (posedge clk_100M or negedge rst_n)
        begin
            if(!rst_n) begin
                add_out_temp[i] <= 32'b0;
            end
            else begin
                add_out_temp[i] <= add_out[i];
            end
        end
    end
endgenerate
//-------------------------------------------
// output
//-------------------------------------------
wire [31:0]                     data_out_part[15:0];
generate
    for(i = 0; i < 16; i = i + 1) begin : data_out_par_gen
        assign data_out_part[i] = less_than_6[i] ? less_than_0[i] ? 32'b0 : add_out_temp[i] : 32'h40C00000;
    end
endgenerate

generate
    for(i = 0; i < 16; i = i + 1) begin : data_combine
        assign data_out[32*i+31 : 32*i] = data_out_part[i];
    end
endgenerate

reg [6:0]                       vld_reg;
always @ (posedge clk_100M or negedge rst_n)
begin
    if(!rst_n) begin
        vld_reg <= 7'b0;
    end
    else begin
        vld_reg <= {vld_reg[5:0], data_in_vld};
    end
end

assign data_out_vld = vld_reg[6];




endmodule