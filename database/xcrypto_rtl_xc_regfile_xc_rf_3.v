// This program was cloned from: https://github.com/scarv/xcrypto
// License: MIT License



//
// module: xc_regfile
//
//  A 3-read-1-write register file, with odd/even banks of registers and
//  double-width writeback to adjacent pairs of registers.
//
module xc_rf_3 (

input  wire        clock      ,
input  wire        resetn     ,
           
input  wire [ 4:0] rs1_addr   ,
output wire [31:0] rs1_rdata  ,
           
input  wire [ 4:0] rs2_addr   ,
output wire [31:0] rs2_rdata  ,

input  wire [ 4:0] rs3_addr   ,
output wire [31:0] rs3_rdata  ,
           
input  wire        rd_wen     ,
input  wire        rd_wide    ,
input  wire [ 4:0] rd_addr    ,
input  wire [31:0] rd_wdata   ,
input  wire [31:0] rd_wdata_hi 

);

reg [31:0] gprs_even [15:0];
reg [31:0] gprs_odd  [15:0];

assign rs1_rdata = rs1_addr[0] ? gprs_even[rs1_addr[4:1]] : gprs_odd[rs1_addr[4:1]];
assign rs2_rdata = rs2_addr[0] ? gprs_even[rs2_addr[4:1]] : gprs_odd[rs2_addr[4:1]];
assign rs3_rdata = rs3_addr[0] ? gprs_even[rs3_addr[4:1]] : gprs_odd[rs3_addr[4:1]];

wire        rd_odd       =  rd_addr[0];
wire        rd_even      = !rd_addr[0];

wire [ 3:0] rd_top       =  rd_addr[4:1];

wire        rd_wen_even  = rd_even && rd_wen;
wire        rd_wen_odd   = (rd_odd || rd_wide) && rd_wen;

wire [31:0] rd_wdata_odd = rd_wide ? rd_wdata_hi : rd_wdata;

genvar i = 0;
generate for(i = 0; i < 16; i = i+1) begin

    if(i == 0) begin

        always @(*) gprs_even[i] = 0;
        
        always @(posedge clock) if(rd_wen_odd && rd_top == i) begin

            gprs_odd[i] <= rd_wdata_odd;

        end

    end else begin

        always @(posedge clock) if(rd_wen_even && rd_top == i) begin

            gprs_even[i] <= rd_wdata;

        end

        always @(posedge clock) if(rd_wen_odd && rd_top == i) begin

            gprs_odd[i] <= rd_wdata_odd;

        end

    end

end endgenerate

endmodule



