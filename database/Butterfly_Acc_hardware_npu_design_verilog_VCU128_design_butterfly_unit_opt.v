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


module butterfly_unit_opt
# (
  // The data width of input data
  parameter caddsub_delay = 1,
  parameter in_data_width=16,
  // The data width utilized for accumulated results
  parameter out_data_width=16,
  // The latency of adder
  parameter latency_add=1,
  // The latency of multiplier
  parameter latency_mul=2
)
(
  input  wire                        clk,
  input  wire                        rst_n,
  input  wire                        is_fft, 
  input  wire  [32*2-1:0]              read_addr_r_A,
  input  wire  [32*2-1:0]              read_addr_r_B,
  output  wire  [32*2-1:0]             write_addr_r_A,
  output  wire  [32*2-1:0]             write_addr_r_B,
  //===================================================//
  // Perform butterfly multiplication: (Ib1 x Wb1), (Ib1 x Wb2), (Ib2 x Wb3), (Ib2 x Wb4)
  // coefficients for butterfly factorization
  input  wire  [4*in_data_width-1:0]  butterfly_coef, //Wb4, 3, 2, 1
  input  wire                          butterfly_coef_vld,
  // up stram data input of butterfly factorization
  input  wire                           butterfly_dat_vld,
  input  wire  [2*in_data_width-1:0]  butterfly_dat, //Ib2, 1: {higher_fft_index, lower_fft_index(add result)}
  output wire                           butterfly_dat_rdy,

  // down stream data output for butterfly
  output wire                        butterfly_dn_vld,
  output wire  [2*out_data_width-1:0]    butterfly_dn_dat,
  input  wire                        butterfly_dn_rdy,

  //===================================================//
  // Perform FFT, twiddle factor multiplication: (Ir2 + Ii2(i)) x (Wr + Wi(i))
  // coefficients for FFT
  input  wire  [in_data_width-1:0]  fft_coef_real,  // Wr
  input  wire  [in_data_width-1:0]  fft_coef_img,  // Wi(i)
  input  wire                          fft_coef_vld,

  // up stram data input of FFT
  input  wire                           fft_dat_vld,
  input  wire  [2*in_data_width-1:0]  fft_dat_real, // Ir1, 2
  input  wire  [2*in_data_width-1:0]  fft_dat_img, // Ii2(i), 2(i)
  output wire                           fft_dat_rdy,

  // down stream data output for FFT
  output wire                        fft_dn_vld,
  output wire  [2*out_data_width-1:0]    fft_dn_dat_real,
  output wire  [2*out_data_width-1:0]    fft_dn_dat_img,
  input  wire                        fft_dn_rdy

);

localparam num_mult = 4;
localparam num_input = 2;
localparam delay_stage_fft_input = (latency_mul + 2) + (latency_add + 1);

/////////////////////Timing//////////////////////////
reg                            is_fft_r;
always @(posedge clk)
begin
    is_fft_r <= is_fft;
end
/////////////////////Timing//////////////////////////


genvar i;

assign butterfly_dat_rdy = butterfly_dn_rdy;

reg  [in_data_width-1:0]           mult_dat[num_mult-1:0];
reg                                mult_dat_vld[num_mult-1:0];
reg  [in_data_width-1:0]           mult_coef[num_mult-1:0];
reg                                mult_coef_vld[num_mult-1:0];

wire  [in_data_width-1:0]           mult_result[num_mult-1:0];
wire                                mult_result_vld[num_mult-1:0];

wire  [in_data_width-1:0]  butterfly_dats[2-1:0];
wire  [in_data_width-1:0]  butterfly_coefs[4-1:0];

wire  [in_data_width-1:0]  fft_dats_real[2-1:0];
wire  [in_data_width-1:0]  fft_dats_img[2-1:0];


// =========================================================================== //
// Generate wires
// =========================================================================== //

generate
for(i=0 ; i<num_input ; i=i+1)
begin : GENERATE_BUTTERFLY_DAT
    assign butterfly_dats[i] = butterfly_dat[( in_data_width*i + in_data_width-1) : (in_data_width*i)];
    assign fft_dats_real[i] = fft_dat_real[( in_data_width*i + in_data_width-1) : (in_data_width*i)];
    assign fft_dats_img[i] = fft_dat_img[( in_data_width*i + in_data_width-1) : (in_data_width*i)];
end
endgenerate

generate
for(i=0 ; i<num_mult ; i=i+1)
begin : GENERATE_BUTTERFLY_COEF
    assign butterfly_coefs[i] = butterfly_coef[( in_data_width*i + in_data_width-1) : (in_data_width*i)];
end
endgenerate
// =========================================================================== //
// Control signal to support runtime adaptable engine
// =========================================================================== //

//  ============ Control for the first multiplier============ //
always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    mult_dat[0] <= 0;
    mult_dat_vld[0] <= 0;
    mult_coef[0] <= 0;
    mult_coef_vld[0] <= 0;
end
else if (is_fft_r) begin
    if (fft_dat_vld && fft_coef_vld) begin // Ir2 * Wr
        mult_dat[0] <= fft_dats_real[1];
        mult_dat_vld[0] <= fft_dat_vld;
        mult_coef[0] <= fft_coef_real;
        mult_coef_vld[0] <= fft_coef_vld;
    end 
    else begin
        mult_dat_vld[0] <= 0;
        mult_coef_vld[0] <= 0;
    end
end
else begin
    if (butterfly_dat_vld && butterfly_coef_vld) begin // (Ib1 x Wb1)
        mult_dat[0] <= butterfly_dats[0];
        mult_dat_vld[0] <= butterfly_dat_vld;
        mult_coef[0] <= butterfly_coefs[0];
        mult_coef_vld[0] <= butterfly_coef_vld;
    end 
    else begin
        mult_dat_vld[0] <= 0;
        mult_coef_vld[0] <= 0;
    end
end

//  ================================================ //

//  ============ Control for the second multiplier============ //
always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    mult_dat[1] <= 0;
    mult_dat_vld[1] <= 0;
    mult_coef[1] <= 0;
    mult_coef_vld[1] <= 0;
end
else if (is_fft_r) begin
    if (fft_dat_vld && fft_coef_vld) begin // Ir2 * Wi(i)
        mult_dat[1] <= fft_dats_real[1];
        mult_dat_vld[1] <= fft_dat_vld;
        mult_coef[1] <= fft_coef_img;
        mult_coef_vld[1] <= fft_coef_vld;
    end 
    else begin
        mult_dat_vld[1] <= 0;
        mult_coef_vld[1] <= 0;
    end
end
else begin
    if (butterfly_dat_vld && butterfly_coef_vld) begin // (Ib1 x Wb2)
        mult_dat[1] <= butterfly_dats[0];
        mult_dat_vld[1] <= butterfly_dat_vld;
        mult_coef[1] <= butterfly_coefs[1];
        mult_coef_vld[1] <= butterfly_coef_vld;
    end 
    else begin
        mult_dat_vld[1] <= 0;
        mult_coef_vld[1] <= 0;
    end
end

//  ================================================ //


//  ============ Control for the third multiplier============ //
always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    mult_dat[2] <= 0;
    mult_dat_vld[2] <= 0;
    mult_coef[2] <= 0;
    mult_coef_vld[2] <= 0;
end
else if (is_fft_r) begin
    if (fft_dat_vld && fft_coef_vld) begin // Ii2(i) * Wi(i)
        mult_dat[2] <= fft_dats_img[1];
        mult_dat_vld[2] <= fft_dat_vld;
        mult_coef[2] <= fft_coef_img;
        mult_coef_vld[2] <= fft_coef_vld;
    end 
    else begin
        mult_dat_vld[2] <= 0;
        mult_coef_vld[2] <= 0;
    end
end
else begin
    if (butterfly_dat_vld && butterfly_coef_vld) begin // (Ib2 x Wb3)
        mult_dat[2] <= butterfly_dats[1];
        mult_dat_vld[2] <= butterfly_dat_vld;
        mult_coef[2] <= butterfly_coefs[2];
        mult_coef_vld[2] <= butterfly_coef_vld;
    end 
    else begin
        mult_dat_vld[2] <= 0;
        mult_coef_vld[2] <= 0;
    end
end

//  ================================================ //


//  ============ Control for the forth multiplier============ //
always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    mult_dat[3] <= 0;
    mult_dat_vld[3] <= 0;
    mult_coef[3] <= 0;
    mult_coef_vld[3] <= 0;
end
else if (is_fft_r) begin
    if (fft_dat_vld && fft_coef_vld) begin // Ii2(i) * Wr
        mult_dat[3] <= fft_dats_img[1];
        mult_dat_vld[3] <= fft_dat_vld;
        mult_coef[3] <= fft_coef_real;
        mult_coef_vld[3] <= fft_coef_vld;
    end 
    else begin
        mult_dat_vld[3] <= 0;
        mult_coef_vld[3] <= 0;
    end
end
else begin
    if (butterfly_dat_vld && butterfly_coef_vld) begin // (Ib2 x Wb4)
        mult_dat[3] <= butterfly_dats[1];
        mult_dat_vld[3] <= butterfly_dat_vld;
        mult_coef[3] <= butterfly_coefs[3];
        mult_coef_vld[3] <= butterfly_coef_vld;
    end 
    else begin
        mult_dat_vld[3] <= 0;
        mult_coef_vld[3] <= 0;
    end
end

//  ================================================ //

// =========================================================================== //
// Generate multipliers 
// =========================================================================== //

generate
for(i=0 ; i<num_mult ; i=i+1)
begin : GENERATE_MULT
    /*
    sif_mult_half_fp #(
        .WIDTH_A(in_data_width),
        .WIDTH_B(in_data_width),
        .WIDTH_P(in_data_width)
    ) u_sif_mult_half_fp
    */
    sif_mult_half_fp u_sif_mult_half_fp
    (
        .clk(clk),
        //.rst_n(rst_n),
        .A_vld(mult_dat_vld[i]),
        .A_dat(mult_dat[i]),
        .A_rdy(),
        .B_vld(mult_coef_vld[i]),
        .B_dat(mult_coef[i]),
        .B_rdy(),
        .P_vld(mult_result_vld[i]),
        .P_dat(mult_result[i]),
        .P_rdy(1'b1)
    ); // sif_mult
end

endgenerate

// =========================================================================== //
// Generate adders
// =========================================================================== //


//  ============ Generate outputs for butterfly ============ //
reg  [in_data_width-1:0]           add_dat[num_mult-1:0];
reg                                add_dat_vld[num_mult-1:0];

wire                               add_result_img_vld;
wire [out_data_width-1:0]          add_result_img_dat;

wire                               add_result_real_vld;
wire [out_data_width-1:0]          add_result_real_dat;

generate
for(i=0 ; i<num_mult ; i=i+1)
begin : GENERATE_ADD_CONTROL
    always @(posedge clk or negedge rst_n)
    if(!rst_n) begin
        add_dat[i] <= 0;
        add_dat_vld[i] <= 0;
    end
    else if (mult_result_vld[i]) begin
        add_dat[i] <= mult_result[i];
        add_dat_vld[i] <= mult_result_vld[i];
    end
    else begin
        add_dat[i] <= 0;
        add_dat_vld[i] <= 0;
    end
end
endgenerate

/* 
sif_addsub_bfe_fixedp #(
    .WIDTH_A(in_data_width),
    .WIDTH_B(in_data_width),
    .WIDTH_S(out_data_width),
    .IS_SUB(1)
) u_sif_sub
*/
sif_addsub_half_fp u_sif_sub
(
    //.rst_n(rst_n),
    .clk(clk),
    .is_sub(is_fft_r),
    .A_vld(add_dat_vld[0]),
    .A_dat(add_dat[0]),
    .A_rdy(),
    .B_vld(add_dat_vld[2]),
    .B_dat(add_dat[2]),
    .B_rdy(),
    .S_vld(add_result_real_vld),
    .S_dat(add_result_real_dat), //  Ir2 * Wr + Ii2(i) * Wi(i)
    .S_rdy(1'b1)
); // sif_add

/*
sif_addsub_bfe_fixedp #(
    .WIDTH_A(in_data_width),
    .WIDTH_B(in_data_width),
    .WIDTH_S(out_data_width),
    .IS_SUB(0)
) u_sif_add
*/
sif_addsub_half_fp u_sif_add
(
    //.rst_n(rst_n),
    .clk(clk),
    .is_sub(1'b0),
    .A_vld(add_dat_vld[1]),
    .A_dat(add_dat[1]),
    .A_rdy(),
    .B_vld(add_dat_vld[3]),
    .B_dat(add_dat[3]),
    .B_rdy(),
    .S_vld(add_result_img_vld),
    .S_dat(add_result_img_dat), // Ir2 * Wi(i) + Ii2(i) * Wr
    .S_rdy(1'b1)
); // sif_add

assign butterfly_dn_dat = {add_result_img_dat, add_result_real_dat};
assign butterfly_dn_vld = add_result_img_vld;

//  ============ Generate outputs for FFT ============ //


wire                               cadd_result_vld[2-1:0];
wire [out_data_width-1:0]          cadd_result_real_dat[2-1:0];
wire [out_data_width-1:0]          cadd_result_img_dat[2-1:0];

reg                               cadd_dat_a_vld[2-1:0];
reg [out_data_width-1:0]          cadd_img_dat_a[2-1:0];
reg [out_data_width-1:0]          cadd_real_dat_a[2-1:0];

reg                               cadd_dat_b_vld[2-1:0];
reg [out_data_width-1:0]          cadd_img_dat_b[2-1:0];
reg [out_data_width-1:0]          cadd_real_dat_b[2-1:0];


//  ============ Control for the first complex adder ============ //

reg  [32*2-1:0]  read_addrs_r_A[delay_stage_fft_input-1+(caddsub_delay+1):0];
reg  [32*2-1:0]  read_addrs_r_B[delay_stage_fft_input-1+(caddsub_delay+1):0];

always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    read_addrs_r_A[0] <= 0;
    read_addrs_r_B[0] <= 0;
end
else begin
    read_addrs_r_A[0] <= read_addr_r_A;
    read_addrs_r_B[0] <= read_addr_r_B;
end

generate
for(i=1 ; i<delay_stage_fft_input+(caddsub_delay+1) ; i=i+1)
begin : GENERATE_DELAY_ADDR
    always @(posedge clk or negedge rst_n)
    if(!rst_n) begin
        read_addrs_r_A[i] <= 0;
        read_addrs_r_B[i] <= 0;
    end
    else begin
        read_addrs_r_A[i] <= read_addrs_r_A[i-1];
        read_addrs_r_B[i] <= read_addrs_r_B[i-1];
    end
end
endgenerate

assign write_addr_r_A = is_fft_r? read_addrs_r_A[delay_stage_fft_input-1+(caddsub_delay+1)] : read_addrs_r_A[delay_stage_fft_input-1];
assign write_addr_r_B = is_fft_r? read_addrs_r_B[delay_stage_fft_input-1+(caddsub_delay+1)] : read_addrs_r_B[delay_stage_fft_input-1];

reg  [in_data_width-1:0]  fft_dats_real_r0[delay_stage_fft_input-1:0];
reg  [in_data_width-1:0]  fft_dats_img_r0[delay_stage_fft_input-1:0];

always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    fft_dats_real_r0[0] <= 0;
    fft_dats_img_r0[0] <= 0;
end
else begin
    fft_dats_real_r0[0] <= fft_dats_real[0];
    fft_dats_img_r0[0] <= fft_dats_img[0];
end

generate
for(i=1 ; i<delay_stage_fft_input ; i=i+1)
begin : GENERATE_DELAY_INPUT
    always @(posedge clk or negedge rst_n)
    if(!rst_n) begin
        fft_dats_real_r0[i] <= 0;
        fft_dats_img_r0[i] <= 0;
    end
    else begin
        fft_dats_real_r0[i] <= fft_dats_real_r0[i-1];
        fft_dats_img_r0[i] <= fft_dats_img_r0[i-1];
    end
end
endgenerate



generate
for(i=0 ; i<num_input ; i=i+1)
begin : GENERATE_CADD_CONTROL
    always @(posedge clk or negedge rst_n)
    if(!rst_n) begin
        cadd_dat_a_vld[i] <= 0;
        cadd_real_dat_a[i] <= 0;
        cadd_img_dat_a[i] <= 0;
        cadd_dat_b_vld[i] <= 0;
        cadd_real_dat_b[i] <= 0;
        cadd_img_dat_b[i] <= 0;
    end
    else if (add_result_img_vld && add_result_real_vld && is_fft_r) begin
        cadd_dat_a_vld[i] <= 1'b1;
        cadd_real_dat_a[i] <= fft_dats_real_r0[delay_stage_fft_input-2];
        cadd_img_dat_a[i] <= fft_dats_img_r0[delay_stage_fft_input-2];
        cadd_dat_b_vld[i] <= 1'b1;
        cadd_real_dat_b[i] <= add_result_real_dat;
        cadd_img_dat_b[i] <= add_result_img_dat;
    end
    else begin
        cadd_dat_a_vld[i] <= 0;
        cadd_dat_b_vld[i] <= 0;
    end
end

endgenerate


sif_add_complex_half_fp #(
    .WIDTH_A(out_data_width),
    .WIDTH_B(out_data_width),
    .WIDTH_S(out_data_width),
    .IS_SUB(1)
) u_sif_sub_complex
(
    .rst_n(rst_n),
    .clk(clk),
    .is_sub(is_fft_r),
    .A_vld(cadd_dat_a_vld[0]),
    .A_real_dat(cadd_real_dat_a[0]), // (Ir1 + Ii1(i)) - (Ir2 + Ii2(i)) x (Wr + Wi(i))
    .A_img_dat(cadd_img_dat_a[0]),
    .A_rdy(),
    .B_vld(cadd_dat_b_vld[0]),
    .B_real_dat(cadd_real_dat_b[0]),
    .B_img_dat(cadd_img_dat_b[0]),
    .B_rdy(),
    .S_vld(cadd_result_vld[0]),
    .S_real_dat(cadd_result_real_dat[0]), 
    .S_img_dat(cadd_result_img_dat[0]),
    .S_rdy(1'b1)
); // sif_add


sif_add_complex_half_fp #(
    .WIDTH_A(out_data_width),
    .WIDTH_B(out_data_width),
    .WIDTH_S(out_data_width),
    .IS_SUB(0)
) u_sif_add_complex
(
    .rst_n(rst_n),
    .clk(clk),
    .is_sub(1'b0),
    .A_vld(cadd_dat_a_vld[1]),
    .A_real_dat(cadd_real_dat_a[1]), // (Ir1 + Ii1(i)) + (Ir2 + Ii2(i)) x (Wr + Wi(i))
    .A_img_dat(cadd_img_dat_a[1]),
    .A_rdy(),
    .B_vld(cadd_dat_b_vld[1]),
    .B_real_dat(cadd_real_dat_b[1]),
    .B_img_dat(cadd_img_dat_b[1]),
    .B_rdy(),
    .S_vld(cadd_result_vld[1]),
    .S_real_dat(cadd_result_real_dat[1]), 
    .S_img_dat(cadd_result_img_dat[1]),
    .S_rdy(1'b1)
); // sif_add

assign fft_dn_vld = cadd_result_vld[0];
assign fft_dn_dat_real = {cadd_result_real_dat[0], cadd_result_real_dat[1]}; // {higher_fft_index(sub result) lower_fft_index(add result)}
assign fft_dn_dat_img = {cadd_result_img_dat[0], cadd_result_img_dat[1]};

endmodule