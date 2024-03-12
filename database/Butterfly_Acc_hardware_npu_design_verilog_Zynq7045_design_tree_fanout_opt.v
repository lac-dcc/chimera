//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Design Name: 
// Module Name: qkv_fanout
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

module tree_fanout_opt
# (
  parameter in_w = 128 * 8,
  parameter fanout_factor = 3
)
(
  input                    clk,
  input                    rst_n,
  input                     up_vld,
  input     [in_w-1:0]      up_dat,
  output                    up_rdy,

  output                   dn_vld,
  input                    dn_rdy,
  output   [fanout_factor*in_w-1:0]     dn_dat
);

localparam num_levels = $clog2(fanout_factor);

genvar i;

reg up_vld_r;
reg [in_w-1 : 0] up_dat_r;

always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    up_vld_r <= 0;
    up_dat_r <= 0;
end
else begin
    up_vld_r <= up_vld;
    up_dat_r <= up_dat;
end

wire [2*in_w -1 :0] dn_dat_level0;
wire dn_vld_level0;
reg [2*in_w -1 :0] up_data_level1;
reg up_vld_level1;

tree_fanout_double #(
   .in_w(in_w)
 ) u_tree_fanout_level0
 (
    .rst_n(rst_n),
    .clk(clk),

    .up_vld(up_vld_r),
    .up_rdy(),
    .up_dat(up_dat_r),
    
    .dn_vld(dn_vld_level0),
    .dn_rdy(1'b1),
    .dn_dat(dn_dat_level0)
 );
 
always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    up_data_level1 <= 0;
    up_vld_level1 <= 0;
end
else begin
    up_data_level1 <= dn_dat_level0;
    up_vld_level1 <= dn_vld_level0;
end
 
wire [4*in_w -1 :0] dn_dat_level1;
wire dn_vld_level1;
reg [4*in_w -1 :0] up_data_level2;
reg up_vld_level2;


tree_fanout_double #(
   .in_w(2*in_w)
 ) u_tree_fanout_level1
 (
    .rst_n(rst_n),
    .clk(clk),

    .up_vld(up_vld_level1),
    .up_rdy(),
    .up_dat(up_data_level1),
    
    .dn_vld(dn_vld_level1),
    .dn_rdy(1'b1),
    .dn_dat(dn_dat_level1)
 );
 
always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    up_data_level2 <= 0;
    up_vld_level2 <= 0;
end
else begin
    up_data_level2 <= dn_dat_level1;
    up_vld_level2 <= dn_vld_level1;
end

wire [8*in_w -1 :0] dn_dat_level2;
wire dn_vld_level2;
reg [8*in_w -1 :0] up_data_level3;
reg up_vld_level3;

tree_fanout_double #(
   .in_w(4*in_w)
 ) u_tree_fanout_level2
 (
    .rst_n(rst_n),
    .clk(clk),

    .up_vld(up_vld_level2),
    .up_rdy(),
    .up_dat(up_data_level2),
    
    .dn_vld(dn_vld_level2),
    .dn_rdy(1'b1),
    .dn_dat(dn_dat_level2)
 );
 
always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    up_data_level3 <= 0;
    up_vld_level3 <= 0;
end
else begin
    up_data_level3 <= dn_dat_level2;
    up_vld_level3 <= dn_vld_level2;
end



wire [16*in_w -1 :0] dn_dat_level3;
wire dn_vld_level3;
reg [16*in_w -1 :0] up_data_level4;
reg up_vld_level4;

tree_fanout_double #(
   .in_w(8*in_w)
 ) u_tree_fanout_level3
 (
    .rst_n(rst_n),
    .clk(clk),

    .up_vld(up_vld_level3),
    .up_rdy(),
    .up_dat(up_data_level3),
    
    .dn_vld(dn_vld_level3),
    .dn_rdy(1'b1),
    .dn_dat(dn_dat_level3)
 );
 
always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    up_data_level4 <= 0;
    up_vld_level4 <= 0;
end
else begin
    up_data_level4 <= dn_dat_level3;
    up_vld_level4 <= dn_vld_level3;
end

wire [32*in_w -1 :0] dn_dat_level4;
wire dn_vld_level4;
reg [32*in_w -1 :0] up_data_level5;
reg up_vld_level5;


tree_fanout_double #(
   .in_w(16*in_w)
 ) u_tree_fanout_level4
 (
    .rst_n(rst_n),
    .clk(clk),

    .up_vld(up_vld_level4),
    .up_rdy(),
    .up_dat(up_data_level4),
    
    .dn_vld(dn_vld_level4),
    .dn_rdy(1'b1),
    .dn_dat(dn_dat_level4)
 );
 
always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    up_data_level5 <= 0;
    up_vld_level5 <= 0;
end
else begin
    up_data_level5 <= dn_dat_level4;
    up_vld_level5 <= dn_vld_level4;
end



wire [64*in_w -1 :0] dn_dat_level5;
wire dn_vld_level5;
reg [64*in_w -1 :0] up_data_level6;
reg up_vld_level6;

tree_fanout_double #(
   .in_w(32*in_w)
 ) u_tree_fanout_level5
 (
    .rst_n(rst_n),
    .clk(clk),

    .up_vld(up_vld_level5),
    .up_rdy(),
    .up_dat(up_data_level5),
    
    .dn_vld(dn_vld_level5),
    .dn_rdy(1'b1),
    .dn_dat(dn_dat_level5)
 );
 
always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    up_data_level6 <= 0;
    up_vld_level6 <= 0;
end
else begin
    up_data_level6 <= dn_dat_level5;
    up_vld_level6 <= dn_vld_level5;
end



wire [128*in_w -1 :0] dn_dat_level6;
wire dn_vld_level6;
reg [128*in_w -1 :0] up_data_level7;
reg up_vld_level7;

tree_fanout_double #(
   .in_w(64*in_w)
 ) u_tree_fanout_level6
 (
    .rst_n(rst_n),
    .clk(clk),

    .up_vld(up_vld_level6),
    .up_rdy(),
    .up_dat(up_data_level6),
    
    .dn_vld(dn_vld_level6),
    .dn_rdy(1'b1),
    .dn_dat(dn_dat_level6)
 );
 
always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    up_data_level7 <= 0;
    up_vld_level7 <= 0;
end
else begin
    up_data_level7 <= dn_dat_level6;
    up_vld_level7 <= dn_vld_level6;
end

wire [256*in_w -1 :0] dn_dat_level7;
wire dn_vld_level7;
reg [256*in_w -1 :0] up_data_level8;
reg up_vld_level8;


tree_fanout_double #(
   .in_w(128*in_w)
 ) u_tree_fanout_level7
 (
    .rst_n(rst_n),
    .clk(clk),

    .up_vld(up_vld_level7),
    .up_rdy(),
    .up_dat(up_data_level7),
    
    .dn_vld(dn_vld_level7),
    .dn_rdy(1'b1),
    .dn_dat(dn_dat_level7)
 );
 
always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    up_data_level8 <= 0;
    up_vld_level8 <= 0;
end
else begin
    up_data_level8 <= dn_dat_level7;
    up_vld_level8 <= dn_vld_level7;
end

generate
  if(fanout_factor <= 2)          // no overflow, add 0 prefix
  begin
    assign dn_vld = up_vld_level1;
    assign dn_dat = up_data_level1[fanout_factor*in_w-1:0];
  end
  else if(fanout_factor <= 4)          // no overflow, add 0 prefix
  begin
    assign dn_vld = up_vld_level2;
    assign dn_dat = up_data_level2[fanout_factor*in_w-1:0];
  end
  else if(fanout_factor <= 8)          // no overflow, add 0 prefix
  begin
    assign dn_vld = up_vld_level3;
    assign dn_dat = up_data_level3[fanout_factor*in_w-1:0];
  end
  else if(fanout_factor <= 16)          // no overflow, add 0 prefix
  begin
    assign dn_vld = up_vld_level4;
    assign dn_dat = up_data_level4[fanout_factor*in_w-1:0];
  end
  else if(fanout_factor <= 32)          // no overflow, add 0 prefix
  begin
    assign dn_vld = up_vld_level5;
    assign dn_dat = up_data_level5[fanout_factor*in_w-1:0];
  end 
  else if(fanout_factor <= 64)          // no overflow, add 0 prefix
  begin
    assign dn_vld = up_vld_level6;
    assign dn_dat = up_data_level6;
  end
  else if (fanout_factor <= 128) begin
    assign dn_vld = up_vld_level7;
    assign dn_dat = up_data_level7[fanout_factor*in_w-1:0];
  end
  else begin
    assign dn_vld = up_vld_level8;
    assign dn_dat = up_data_level8[fanout_factor*in_w-1:0];
  end
  
endgenerate


endmodule
