
module Gen1_2_DataPath(
    input [511:0]Data_in,
    input [63:0]DK,
    input [63:0]valid,
    output [511:0]Data_out,
    input clk,
    output [63:0]dlpstart ,
    output [63:0]dlpend   ,
    output [63:0]tlpstart ,
    output [63:0]tlpedb   ,
    output [63:0]tlpend   ,
    output [63:0]valid_d
    
);

wire [63:0]tlp_or_dllp1;

wire [63:0]tlp_or_dllp2;
localparam N = 64;

wire [1:0]tlp_or_dllp_reg_in;
wire [1:0]tlp_or_dllp_reg_out;
assign Data_out = Data_in;
generate
    genvar i;
    for(i=0;i<64;i = i + 1)
        begin  : generate_checkbytes
          if(i == 0)
          begin
            check_byte CheckByte(
                .data_in(Data_in[8*(i+1)-1:8*i]),
                .tlp_or_dllp_in(tlp_or_dllp_reg_out),
                .valid(valid[i]),
                .DK(DK[i]),
                
                .type({valid_d[i],tlpstart[i],tlpend[i],dlpend[i],dlpstart[i],tlpedb[i]}),
                .tlp_or_dllp_out({tlp_or_dllp1[0],tlp_or_dllp2[0]})

            );  
          end
          else if (i == N-1) begin
              check_byte CheckByte(
                .data_in(Data_in[8*(i+1)-1:8*i]),
                .tlp_or_dllp_in({tlp_or_dllp1[62],tlp_or_dllp2[62]}),
                .valid(valid[i]),
                .DK(DK[i]),
               
                .type({valid_d[i],tlpstart[i],tlpend[i],dlpend[i],dlpstart[i],tlpedb[i]}),
                .tlp_or_dllp_out(tlp_or_dllp_reg_in)
            );  
          end
          else 
          begin
             check_byte CheckByte(
                .data_in(Data_in[8*(i+1)-1:8*i]),
                .tlp_or_dllp_in({tlp_or_dllp1[i-1],tlp_or_dllp2[i-1]}),
                .valid(valid[i]),
                .DK(DK[i]),
              
                .type({valid_d[i],tlpstart[i],tlpend[i],dlpend[i],dlpstart[i],tlpedb[i]}),
                .tlp_or_dllp_out({tlp_or_dllp1[i],tlp_or_dllp2[i]})
            );      
          end  
            


        end
 

endgenerate

reg [1:0] data_out_reg;
always @(posedge clk) begin
    data_out_reg <= tlp_or_dllp_reg_in;
end
assign tlp_or_dllp_reg_out = data_out_reg;

endmodule