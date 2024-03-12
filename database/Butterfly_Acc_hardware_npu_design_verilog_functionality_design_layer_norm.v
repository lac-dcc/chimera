//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Design Name: 
// Module Name: react_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module layer_norm
# (
  // The data width of input data
  parameter data_width=16,
  // parallelsim of layer normalization
  parameter p_ln = 8
)
(
  input  wire                        clk,
  input  wire                        rst_n,
  // coefficients for the kernel, each in 8-bit unsigned int format
  input  wire  [p_ln * data_width-1:0]     up_dat,
  input  wire                          up_vld,
  input  wire                          up_rdy, 
  input  wire  [data_width-1:0]                bias_ln, 
  input  wire  [16-1:0]              length,
  
  // down stream data output, one transaction per component of an output pixel
  output wire                        dn_vld,
  output wire  [p_ln * data_width-1:0]    dn_dat,
  input  wire                        dn_rdy

);

localparam acc_data_width = data_width;

genvar i;


reg mean_vld;
reg [data_width-1 : 0] mean_dat;
reg [16-1 : 0] mean_counter;

wire mean_div_vld;
wire [data_width-1 : 0] mean_div_dat;

reg var_vld;
reg [acc_data_width-1 : 0] var_dat;
reg [16-1 : 0] var_counter;

wire dn_vld_tree_fanout;
wire [3*p_ln*data_width-1:0] dn_dat_tree_fanout;
wire [p_ln*data_width-1:0] dn_dat_tree_fanouts[3-1 : 0];
tree_fanout #(
   .in_w(p_ln*data_width),
   .fanout_factor(3)
 ) u_tree_fanout_v
 (
    .rst_n(rst_n),
    .clk(clk),

    .up_vld(up_vld),
    .up_rdy(),
    .up_dat(up_dat),
    
    .dn_vld(dn_vld_tree_fanout),
    .dn_rdy(1'b1),
    .dn_dat(dn_dat_tree_fanout)
 );
generate
for (i=0 ; i<3; i=i+1)
begin : GENERATE_TREE_OUT
    //assign up_dats_a[i] = up_dat_a[( data_width*i + data_width-1) : (data_width*i)];
    //assign up_dats_b[i] = up_dat_b[( data_width*i + data_width-1) : (data_width*i)];
    assign dn_dat_tree_fanouts[i] = dn_dat_tree_fanout[( p_ln*data_width*i + p_ln*data_width-1) : (p_ln*data_width*i)];

end
endgenerate

//First Branch

wire dn_vld_fifo_1st_1;
wire dn_rdy_fifo_1st_1;
wire [p_ln*data_width-1 : 0] dn_dat_fifo_1st_1;

sif_fifo #(
    .w(p_ln*data_width),
    .d(1024)
) u_sif_fifo_1st_1
(
    .rst_n(rst_n),
    .clk(clk),

    .up_vld(dn_vld_tree_fanout),
    .up_dat(dn_dat_tree_fanouts[0]),
    .up_rdy(),

    .dn_vld(dn_vld_fifo_1st_1),
    .dn_dat(dn_dat_fifo_1st_1),
    .dn_rdy(dn_rdy_fifo_1st_1)
); // sif_fifo_reg

assign dn_rdy_fifo_1st_1 = mean_div_vld;

// ********************************* //

wire [data_width-1 : 0] dn_dat_fifo_1st_1s [p_ln-1 : 0];

wire dn_vld_add_1st_1 [p_ln-1 : 0];
wire [data_width - 1 : 0] dn_dat_add_1st_1 [p_ln-1 : 0];
reg dn_vld_add_1st_1_r [p_ln-1 : 0];
reg [data_width - 1 : 0] dn_dat_add_1st_1_r [p_ln-1 : 0];


wire dn_vld_mult[p_ln-1 : 0];
wire [2*data_width -1 : 0] dn_dat_mult[p_ln-1 : 0];

reg dn_vld_mult_r[p_ln-1 : 0];
reg [2*data_width -1 : 0] dn_dat_mult_r[p_ln-1 : 0];

generate
for (i=0 ; i<p_ln; i=i+1)
begin : GENERATE_VARs
    assign dn_dat_fifo_1st_1s[i] = dn_dat_fifo_1st_1[(data_width*i + data_width-1) : (data_width*i)];

    sif_sub_half_fp u_sif_sub_1st_1
    (
        .clk(clk),
        .B_vld(dn_vld_fifo_1st_1),
        .B_dat(dn_dat_fifo_1st_1s[i]), // Second fanout branch
        .B_rdy(),
        .A_vld(mean_div_vld),
        .A_dat(mean_div_dat),
        .A_rdy(),
        .S_vld(dn_vld_add_1st_1[i]),
        .S_dat(dn_dat_add_1st_1[i]),
        .S_rdy(1'b1)
    ); // sif_add

    always @(posedge clk or negedge rst_n)
    if(!rst_n) begin
        dn_vld_add_1st_1_r[i] <= 0;
        dn_dat_add_1st_1_r[i] <= 0;
    end
    else begin
        dn_vld_add_1st_1_r[i] <= dn_vld_add_1st_1[i];
        dn_dat_add_1st_1_r[i] <= dn_dat_add_1st_1[i];
    end

    //  Sqaure

    sif_mult_half_fp u_sqaure
    (
        .clk(clk),
        .A_vld(dn_vld_add_1st_1_r[i]),
        .A_dat(dn_dat_add_1st_1_r[i]),
        .A_rdy(),
        .B_vld(dn_vld_add_1st_1_r[i]),
        .B_dat(dn_dat_add_1st_1_r[i]),
        .B_rdy(),
        .P_vld(dn_vld_mult[i]),
        .P_dat(dn_dat_mult[i]), // A * B
        .P_rdy(1'b1)
    ); // sif_mult    


    always @(posedge clk or negedge rst_n)
    if(!rst_n) begin
        dn_vld_mult_r[i] <= 0;
        dn_dat_mult_r[i] <= 0;
    end
    else begin
        dn_vld_mult_r[i] <= dn_vld_mult[i];
        dn_dat_mult_r[i] <= dn_dat_mult[i];
    end
end
endgenerate


wire accu_var_l1_vld[p_ln/2-1 : 0];
wire [2*data_width-1 : 0] accu_var_l1_dat[p_ln/2-1 : 0];

generate
for (i=0 ; i<p_ln/2; i=i+1)
begin : GENERATE_FIRST_ADDER_VAR
    sif_addsub_half_fp u_sif_add1_var
    (
        .clk(clk),
        .is_sub(1'b0),
        .A_vld(dn_vld_mult_r[2*i]),
        .A_dat(dn_dat_mult_r[2*i]),
        .A_rdy(),
        .B_vld(dn_vld_mult_r[2*i+1]),
        .B_dat(dn_dat_mult_r[2*i+1]),
        .B_rdy(),
        .S_vld(accu_var_l1_vld[i]),
        .S_dat(accu_var_l1_dat[i]),
        .S_rdy(1'b1)
    ); // sif_add
end
endgenerate

wire accu_var_l2_vld[p_ln/4-1 : 0];
wire [2*data_width-1 : 0] accu_var_l2_dat[p_ln/4-1 : 0];

generate
for (i=0 ; i<p_ln/4; i=i+1)
begin : GENERATE_SECOND_ADDER_VAR
    sif_addsub_half_fp u_sif_add2_var
    (
        .clk(clk),
        .is_sub(1'b0),
        .A_vld(accu_var_l1_vld[2*i]),
        .A_dat(accu_var_l1_dat[2*i]),
        .A_rdy(),
        .B_vld(accu_var_l1_vld[2*i+1]),
        .B_dat(accu_var_l1_dat[2*i+1]),
        .B_rdy(),
        .S_vld(accu_var_l2_vld[i]),
        .S_dat(accu_var_l2_dat[i]),
        .S_rdy(1'b1)
    ); // sif_add
end
endgenerate

wire accu_var_l3_vld;
wire [2*data_width-1 : 0] accu_var_l3_dat;


generate
if (p_ln==8) begin : GENERATE_MEAN_WITH_8_INPUTS_VAR
    sif_addsub_half_fp u_sif_add3_var_8in
    (
        .clk(clk),
        .is_sub(1'b0),
        .A_vld(accu_var_l2_vld[1]),
        .A_dat(accu_var_l2_dat[1]),
        .A_rdy(),
        .B_vld(accu_var_l2_vld[0]),
        .B_dat(accu_var_l2_dat[0]),
        .B_rdy(),
        .S_vld(accu_var_l3_vld),
        .S_dat(accu_var_l3_dat),
        .S_rdy(1'b1)
    ); // sif_add
end
else begin
    illegal_parameter_condition_triggered_will_instantiate_an non_existing_module();
end
endgenerate

// Sum 

wire partial_var_vld;
wire [acc_data_width-1 : 0] partial_var;
wire acc_var_vld;
wire [acc_data_width-1 : 0] acc_var_dat;
wire acc_var_out;
reg [16-1:0] acc_var_counter;
reg acc_var_out_r;

always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    //acc_mean_out <= 0;
    acc_var_counter <= 0; 
end
else if (accu_var_l3_vld) begin
    if (acc_var_counter == length - p_ln) begin
        //acc_mean_out <= 1;
        acc_var_counter <= 0;
    end
    else begin
        //acc_mean_out <= 0;
        acc_var_counter <= acc_var_counter + p_ln;
    end
end

assign acc_var_out = (acc_var_counter == length - p_ln) & accu_var_l3_vld;

always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    acc_var_out_r <= 0; 
end
else begin
    acc_var_out_r <= acc_var_out;
end

assign partial_var_vld = accu_var_l3_vld;
assign partial_var = (acc_var_vld) ? acc_var_dat : {acc_data_width{1'b0}};
sif_addsub_half_fp u_sif_acc_1st_var
(
    .clk(clk),
    .is_sub(1'b0),
    .B_vld(accu_var_l3_vld),
    .B_dat(accu_var_l3_dat), // Second fanout branch
    .B_rdy(),
    .A_vld(partial_var_vld),
    .A_dat(partial_var),
    .A_rdy(),
    .S_vld(acc_var_vld),
    .S_dat(acc_var_dat),
    .S_rdy(1'b1)
); // sif_add

// Reciprocal and Root

wire [acc_data_width-1 : 0] dn_dat_div;
wire dn_vld_div;

wire [acc_data_width-1 : 0] dn_dat_norm_var;
wire dn_vld_norm_var;


sif_div_half_fp u_norm_var_div
(
    .clk(clk),
    .A_vld(acc_var_out_r),
    .A_dat(acc_var_dat),
    .A_rdy(),
    .B_vld(1'b1),
    .B_dat(16'h5c00),
    .B_rdy(),
    .P_vld(dn_vld_norm_var),
    .P_dat(dn_dat_norm_var), // A / B
    .P_rdy(1'b1)
); // sif_div

sif_recip_square_half_fp u_sif_recip_square
(
    .clk(clk),
    .A_vld(dn_vld_norm_var),
    .A_dat(dn_dat_norm_var),
    .A_rdy(),
    .P_vld(dn_vld_div),
    .P_dat(dn_dat_div),
    .P_rdy(1'b1)
);

always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    var_vld <= 0;
    var_dat <= 0; 
    var_counter <= 0;
end
else if (var_counter != 0) begin
    var_counter <= var_counter - p_ln;
    var_vld <= 1;
    var_dat <= var_dat;
end
else if (dn_vld_div) begin
    var_counter <= length - p_ln;
    var_vld <= 1;
    var_dat <= dn_dat_div;
end
else begin
    var_vld <= 0;
    var_dat <= 0; 
    var_counter <= 0;
end


//Second Branch
wire partial_result_vld;
wire [acc_data_width-1 : 0] partial_result;
wire acc_mean_vld;
wire [acc_data_width-1 : 0] acc_mean_dat;
wire acc_mean_out;
reg [16-1:0] acc_mean_counter;
reg acc_mean_out_r;

wire [data_width-1 : 0] up_mean_dats [p_ln-1 : 0];

generate
for (i=0 ; i<p_ln; i=i+1)
begin : GENERATE_UP_MEAN_DATA
    assign up_mean_dats[i] = dn_dat_tree_fanouts[1][(data_width*i + data_width-1) : (data_width*i)];
end
endgenerate

wire accu_l1_vld[p_ln/2-1 : 0];
wire [data_width-1 : 0] accu_l1_dat[p_ln/2-1 : 0];

generate
for (i=0 ; i<p_ln/2; i=i+1)
begin : GENERATE_FIRST_ADDER_MEAN
    sif_addsub_half_fp u_sif_add1
    (
        .clk(clk),
        .is_sub(1'b0),
        .A_vld(dn_vld_tree_fanout),
        .A_dat(up_mean_dats[2*i]),
        .A_rdy(),
        .B_vld(dn_vld_tree_fanout),
        .B_dat(up_mean_dats[2*i+1]),
        .B_rdy(),
        .S_vld(accu_l1_vld[i]),
        .S_dat(accu_l1_dat[i]),
        .S_rdy(1'b1)
    ); // sif_add
end
endgenerate

wire accu_l2_vld[p_ln/4-1 : 0];
wire [data_width-1 : 0] accu_l2_dat[p_ln/4-1 : 0];

generate
for (i=0 ; i<p_ln/4; i=i+1)
begin : GENERATE_SECOND_ADDER_MEAN
    sif_addsub_half_fp u_sif_add2
    (
        .clk(clk),
        .is_sub(1'b0),
        .A_vld(accu_l1_vld[2*i]),
        .A_dat(accu_l1_dat[2*i]),
        .A_rdy(),
        .B_vld(accu_l1_vld[2*i+1]),
        .B_dat(accu_l1_dat[2*i+1]),
        .B_rdy(),
        .S_vld(accu_l2_vld[i]),
        .S_dat(accu_l2_dat[i]),
        .S_rdy(1'b1)
    ); // sif_add
end
endgenerate

wire accu_l3_vld;
wire [data_width-1 : 0] accu_l3_dat;

generate
if (p_ln==8) begin : GENERATE_MEAN_WITH_8_INPUTS_MEAN
    sif_addsub_half_fp u_sif_add3_8in
    (
        .clk(clk),
        .is_sub(1'b0),
        .A_vld(accu_l2_vld[1]),
        .A_dat(accu_l2_dat[1]),
        .A_rdy(),
        .B_vld(accu_l2_vld[0]),
        .B_dat(accu_l2_dat[0]),
        .B_rdy(),
        .S_vld(accu_l3_vld),
        .S_dat(accu_l3_dat),
        .S_rdy(1'b1)
    ); // sif_add
end
else begin
    illegal_parameter_condition_triggered_will_instantiate_an non_existing_module();
end
endgenerate



always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    acc_mean_counter <= 0; 
end
else if (accu_l3_vld) begin
    if (acc_mean_counter == length - p_ln) begin
        acc_mean_counter <= 0;
    end
    else begin
        acc_mean_counter <= acc_mean_counter + p_ln;
    end
end

assign acc_mean_out = (acc_mean_counter == length - p_ln) & accu_l3_vld;

always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    acc_mean_out_r <= 0; 
end
else begin
    acc_mean_out_r <= acc_mean_out; 
end

assign partial_result_vld = accu_l3_vld;
// assign partial_result = (accu_l3_vld & acc_mean_out) ? acc_mean_dat : {acc_data_width{1'b0}};
assign partial_result = (acc_mean_vld) ? acc_mean_dat : {acc_data_width{1'b0}};
sif_addsub_half_fp u_sif_acc_2nd_branch
(
    .clk(clk),
    .is_sub(1'b0),
    .B_vld(accu_l3_vld),
    .B_dat(accu_l3_dat), // Second fanout branch
    .B_rdy(),
    .A_vld(partial_result_vld),
    .A_dat(partial_result),
    .A_rdy(),
    .S_vld(acc_mean_vld),
    .S_dat(acc_mean_dat),
    .S_rdy(1'b1)
); // sif_add


always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    mean_vld <= 0;
    mean_dat <= 0; 
    mean_counter <= 0;
end
else if (mean_counter != 0) begin
    mean_counter <= mean_counter - p_ln;
    mean_vld <= 1;
    mean_dat <= mean_dat;
end
else if (acc_mean_out_r) begin
    mean_counter <= length - p_ln;
    mean_vld <= 1;
    mean_dat <= acc_mean_dat;
end
else begin
    mean_vld <= 0;
    mean_dat <= 0; 
    mean_counter <= 0;
end

sif_div_half_fp u_mean_div
(
    .clk(clk),
    .A_vld(mean_vld),
    .A_dat(mean_dat),
    .A_rdy(),
    .B_vld(1'b1),
    .B_dat(16'h5c00),
    .B_rdy(),
    .P_vld(mean_div_vld),
    .P_dat(mean_div_dat), // A * B
    .P_rdy(1'b1)
); // sif_div



//Third Branch

wire dn_vld_fifo_3rd_1;
wire dn_rdy_fifo_3rd_1;
wire [p_ln*data_width-1 : 0] dn_dat_fifo_3rd_1;

wire dn_vld_fifo_3rd_2 [p_ln-1 : 0];
wire dn_rdy_fifo_3rd_2 [p_ln-1 : 0];
wire [data_width+1 -1 : 0] dn_dat_fifo_3rd_2 [p_ln-1 : 0];

sif_fifo #(
    .w(p_ln*data_width),
    .d(1024)
) u_sif_fifo_3rd_1
(
    .rst_n(rst_n),
    .clk(clk),

    .up_vld(dn_vld_tree_fanout),
    .up_dat(dn_dat_tree_fanouts[2]),
    .up_rdy(),

    .dn_vld(dn_vld_fifo_3rd_1),
    .dn_dat(dn_dat_fifo_3rd_1),
    .dn_rdy(dn_rdy_fifo_3rd_1)
); // sif_fifo_reg

assign dn_rdy_fifo_3rd_1 = mean_div_vld;


wire dn_vld_add_3rd_1 [p_ln-1 : 0];
wire [data_width- 1 : 0] dn_dat_add_3rd_1 [p_ln-1 : 0];
wire [data_width-1 : 0] dn_dat_fifo_3rd_1s [p_ln-1 : 0];


wire dn_vld_mult_var [p_ln-1 : 0];
wire [acc_data_width - 1 : 0] dn_dat_mult_var [p_ln-1 : 0];

reg dn_vld_mult_var_r [p_ln-1 : 0];
reg [acc_data_width - 1 : 0] dn_dat_mult_var_r [p_ln-1 : 0];


wire dn_vld_bias [p_ln-1 : 0];
wire [acc_data_width - 1 : 0] dn_dat_bias [p_ln-1 : 0];

wire dn_vld_bias_fifo [p_ln-1 : 0];
wire [acc_data_width - 1 : 0] dn_dat_bias_fifo [p_ln-1 : 0];
wire dn_rdy_bias_fifo [p_ln-1 : 0];

generate
for (i=0 ; i<p_ln; i=i+1)
begin : GENERATE_UP_FINAL_DATA
    assign dn_dat_fifo_3rd_1s[i] = dn_dat_fifo_3rd_1[(data_width*i + data_width-1) : (data_width*i)];
    sif_sub_half_fp u_sif_sub_3rd_1
    (
        .clk(clk),
        .A_vld(dn_vld_fifo_3rd_1),
        .A_dat(dn_dat_fifo_3rd_1s[i]), // Second fanout branch
        .A_rdy(),
        .B_vld(mean_div_vld),
        .B_dat(mean_div_dat),
        .B_rdy(),
        .S_vld(dn_vld_add_3rd_1[i]),
        .S_dat(dn_dat_add_3rd_1[i]),
        .S_rdy(1'b1)
    ); // sif_add

    sif_fifo #(
        .w(data_width),
        .d(1024)
    ) u_sif_fifo_3rd_2
    (
        .rst_n(rst_n),
        .clk(clk),

        .up_vld(dn_vld_add_3rd_1[i]),
        .up_dat(dn_dat_add_3rd_1[i]),
        .up_rdy(),

        .dn_vld(dn_vld_fifo_3rd_2[i]),
        .dn_dat(dn_dat_fifo_3rd_2[i]),
        .dn_rdy(dn_rdy_fifo_3rd_2[i])
    ); // sif_fifo_reg

    assign dn_rdy_fifo_3rd_2[i] = var_vld; 

    sif_mult_half_fp u_square_var
    (
        .clk(clk),
        .A_vld(dn_vld_fifo_3rd_2[i]),
        .A_dat(dn_dat_fifo_3rd_2[i]),
        .A_rdy(),
        .B_vld(var_vld),
        .B_dat(var_dat),
        .B_rdy(),
        .P_vld(dn_vld_mult_var[i]),
        .P_dat(dn_dat_mult_var[i]), // A * B
        .P_rdy(1'b1)
    ); // sif_mult

    always @(posedge clk or negedge rst_n)
    if(!rst_n) begin
        dn_vld_mult_var_r[i] <= 0;
        dn_dat_mult_var_r[i] <= 0; 
    end
    else begin
        dn_vld_mult_var_r[i] <= dn_vld_mult_var[i];
        dn_dat_mult_var_r[i] <= dn_dat_mult_var[i]; 
    end

    sif_addsub_half_fp u_sif_bias
    (
        .clk(clk),
        .is_sub(1'b0),
        .B_vld(dn_vld_mult_var_r[i]),
        .B_dat(dn_dat_mult_var_r[i]), // Second fanout branch
        .B_rdy(),
        .A_vld(dn_vld_mult_var_r[i]),
        .A_dat(bias_ln),
        .A_rdy(),
        .S_vld(dn_vld_bias[i]),
        .S_dat(dn_dat_bias[i]),
        .S_rdy(1'b1)
    ); // sif_add

    sif_fifo #(
        .w(data_width),
        .d(1024)
    ) u_sif_bias_fifo
    (
        .rst_n(rst_n),
        .clk(clk),

        .up_vld(dn_vld_bias[i]),
        .up_dat(dn_dat_bias[i]),
        .up_rdy(),

        .dn_vld(dn_vld_bias_fifo[i]),
        .dn_dat(dn_dat_bias_fifo[i]),
        .dn_rdy(dn_rdy_bias_fifo[i])
    ); // sif_fifo_reg

    assign dn_rdy_bias_fifo[i] = dn_rdy_control;
    assign dn_dat[(data_width*i + data_width-1) : (data_width*i)] = dn_dat_bias_fifo[i];
end
endgenerate

reg                     dn_rdy_control;
reg [data_width-1:0]    out_counter;

assign dn_vld = dn_vld_bias_fifo[0] & dn_rdy_control;

always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    dn_rdy_control <= 1'b0;
    out_counter <= 0 ;
end
else begin
    if (out_counter > 0) begin
        out_counter = out_counter - 1;
        dn_rdy_control <= 1'b0;
    end else begin
        if (dn_vld_bias_fifo[0]) begin
            out_counter = p_ln - 1;
            dn_rdy_control <= 1'b1;
        end else begin
            out_counter = 0;
            dn_rdy_control <= 1'b0;
        end
    end
end


endmodule