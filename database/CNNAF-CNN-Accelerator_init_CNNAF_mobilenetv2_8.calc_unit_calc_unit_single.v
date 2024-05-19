// This program was cloned from: https://github.com/eda-lab/CNNAF-CNN-Accelerator_init
// License: MIT License

module calc_unit_single(
    input                       clk_100M,
    input                       rst_n,
    
    input [32*9-1:0]            w_in,
    input                       data_in_vld,
    input [32*9-1:0]            data_in,
    
    // input [7:0]                 acc_para,
    input                       new_start,
    
    // output                      data_out_vld,
    output [31:0]               data_out
);

//-------------------------------------------
// mul of input
//-------------------------------------------
wire [31:0]                     mul_a[8:0];
wire [31:0]                     mul_b[8:0];
wire [31:0]                     mul_o[8:0];
genvar i;
integer j;

generate 
	for (i = 0; i < 9; i = i + 1) begin : mul_data
		assign	mul_a[i] = data_in[32*i+31:32*i];
		assign	mul_b[i] =    w_in[32*i+31:32*i];
	end
endgenerate

generate 
    for (i = 0; i < 9; i = i + 1) begin : mul_gen
        fp_mul mul
        (
            .clk                (clk_100M),    //    clk.clk
            .areset             (~rst_n), // areset.reset
            .a                  (mul_a[i]),      //      a.a
            .b                  (mul_b[i]),      //      b.b
            .q                  (mul_o[i])       //      q.q
        );
    end
endgenerate

//-------------------------------------------
// add of mul
//-------------------------------------------
wire [31:0]                     add_of2[3:0];
generate 
    for (i = 0; i < 4; i = i + 1) begin : add_of_2_gen
        fp_add fp_add_2
		(
            .clk                (clk_100M),    //    clk.clk
            .areset             (~rst_n), // areset.reset
            .a                  (mul_o[2 * i]),      //      a.a
            .b                  (mul_o[2 * i + 1]),      //      b.b
            .q                  (add_of2[i])       //      q.q
        );
    end
endgenerate

wire [31:0]                     add_of4[1:0];
generate 
    for (i = 0; i < 2; i = i + 1) begin : add_of_4_gen
        fp_add fp_add_4
        (
            .clk                (clk_100M),    //    clk.clk
            .areset             (~rst_n), // areset.reset
            .a                  (add_of2[2 * i]),      //      a.a
            .b                  (add_of2[2 * i + 1]),      //      b.b
            .q                  (add_of4[i])       //      q.q
        );
    end
endgenerate

wire [31:0]                     add_of8;

fp_add fp_add_8(
    .clk                        (clk_100M),    //    clk.clk
    .areset                     (~rst_n), // areset.reset
    .a                          (add_of4[0]),      //      a.a
    .b                          (add_of4[1]),      //      b.b
    .q                          (add_of8)       //      q.q
);

wire [31:0]                     add_ofall;
reg [31:0]						mul_o8_reg[20:0];

always @ (posedge clk_100M or negedge rst_n)
begin 
	if(!rst_n) begin 
		for (j = 0; j < 21; j = j + 1) begin 
			mul_o8_reg[j] <= 32'd0;
		end
	end 
	else begin 
		for (j = 0; j < 21; j = j + 1) begin
			if (j == 0) begin 
				mul_o8_reg[0] <= mul_o[8];
			end
			else begin 
				mul_o8_reg[j] <= mul_o8_reg[j - 1];
			end
		end
	end
end

fp_add add_all(
    .clk                        (clk_100M),    //    clk.clk
    .areset                     (~rst_n), // areset.reset
    .a                          (add_of8),      //      a.a
    .b                          (mul_o8_reg[17]),      //      b.b
    .q                          (add_ofall)       //      q.q
);

//-------------------------------------------
// acc of add
//-------------------------------------------

reg [27:0]                      n_s_reg;
always @ (posedge clk_100M or negedge rst_n)
begin
    if(!rst_n) begin
        n_s_reg <= 28'b0;
    end
    else begin
        n_s_reg <= {n_s_reg[26:0], new_start};
    end
end

reg [27:0]                      data_in_vld_reg;
always @ (posedge clk_100M or negedge rst_n)
begin
    if(!rst_n) begin
        data_in_vld_reg <= 28'b0;
    end
    else begin
        data_in_vld_reg <= {data_in_vld_reg[26:0], data_in_vld};
    end
end

// reg [7:0]                       acc_para_reg[27:0];
// always @ (posedge clk_100M or negedge rst_n)
// begin
    // if(!rst_n) begin
        // for (j = 0; j < 28; j = j + 1) begin
            // acc_para_reg[j] <= 8'd255;
        // end
    // end
    // else begin
        // for (j = 0; j < 28; j = j + 1) begin
            // if(j == 0) begin
                // acc_para_reg[0] <= acc_para;
            // end
            // else begin
                // acc_para_reg[j] <= acc_para_reg[j - 1];
            // end
        // end
    // end
// end


// reg [7:0]                      acc_cnt_cur;
// always @ (posedge clk_100M or negedge rst_n)
// begin
    // if(!rst_n) begin
        // acc_cnt_cur <= 8'b0;
    // end
    // else if (acc_cnt_cur >= acc_para) begin
        // acc_cnt_cur <= 8'b0;
    // end
    // else if (data_in_vld == 1'b1) begin
        // acc_cnt_cur <= acc_cnt_cur + 1'b1;
    // end
// end

// wire                            data_out_vld_cur;
// assign data_out_vld_cur = (acc_cnt_cur == acc_para) && (data_in_vld == 1'b1);

// reg  [31:0]                     data_out_vld_reg;
// always @ (posedge clk_100M or negedge rst_n)
// begin
    // if(!rst_n) begin
        // data_out_vld_reg <= 31'b0;
    // end
    // else begin
        // data_out_vld_reg <= {data_out_vld_reg[30:0], data_out_vld_cur};
    // end
// end

wire [31:0]             acc_in;
wire [31:0]             acc_out;
assign acc_in = data_in_vld_reg[27] ? add_ofall : 32'b0;

fp_acc acc(
    .clk                        (clk_100M),    //    clk.clk
    .areset                     (~rst_n), // areset.reset
    .x                          (acc_in),      //      x.x
    .n                          (n_s_reg[27]),      //      n.n
    .r                          (acc_out),      //      r.r
    .xo                         (),     //     xo.xo
    .xu                         (),     //     xu.xu
    .ao                         (),     //     ao.ao
    .en                         (1'b1)      //     en.en
);

assign data_out = acc_out;
// assign data_out_vld = data_out_vld_reg[31];

endmodule