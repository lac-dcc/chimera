
module Gen3_DataPath(
  input  [511:0]Data_in,
  input  [63:0]valid,
  input  [31:0]syncHeader,
input    clk,
input rst,
  output [511:0]Data_out,
  output [63:0]dlpstart ,
  output [63:0]dlpend   ,
  output [63:0]tlpstart ,
  output [63:0]tlpedb   ,
  output [63:0]tlpend   ,
  output [63:0]valid_d
  
);

localparam N = 65;

wire [11:0]count_limit[0:64];
wire [11:0]count_byte[0:64]; 
wire [2:0]header_byte[0:64];
reg [127:0]syncHeader1;

assign Data_out = Data_in;
reg h;
integer j=0;
always @(*) 

begin
  syncHeader1 = syncHeader;

  h = 0;
  for(j=0;j<32;j = j + 2)
  begin
    syncHeader1[h] = syncHeader[j];
    syncHeader1[h+1] = syncHeader[j+1];

    syncHeader1[h+2] = syncHeader[j];
    syncHeader1[h+3] = syncHeader[j+1];

    syncHeader1[h+4] = syncHeader[j];
    syncHeader1[h+5] = syncHeader[j+1];

    syncHeader1[h+6] = syncHeader[j];
    syncHeader1[h+7] = syncHeader[j+1];
    h = h + 8;
  end
end
generate
  genvar i;
  for(i=0;i<64;i = i + 1)
      begin  : generate_checkbytes_gen3
        if(i == 0)
        begin
          Gen_3_check_byte CheckByte3(
              .data_in(Data_in[8*(i+1)-1:8*i]),
              .byte_count_in(count_byte[N-1]),
              .byte_header_in(header_byte[N-1]),
              .count_limit_in(count_limit[N-1]),
              .syncHeader(syncHeader1[2*(i+1)-1:2*i]),
              .valid(valid[i]),
              .byte_count_out(count_byte[i]),
              .byte_header_out(header_byte[i]),
              .count_limit_out(count_limit[i]),
              .type({valid_d[i],tlpstart[i],tlpend[i],dlpend[i],dlpstart[i],tlpedb[i]}),
              .rst(rst)
          );  
        end
        else if (i == N-2) begin
            Gen_3_check_byte CheckByte3(
              .data_in(Data_in[8*(i+1)-1:8*i]),
              .byte_count_in( count_byte[62]  ),
              .byte_header_in(header_byte[62]),
              .count_limit_in(count_limit[62]),
              .syncHeader    (syncHeader1[2*(i+1)-1:2*i]),
              .valid(valid[i]),
              .byte_count_out(count_byte[i]),
              .byte_header_out(header_byte[i]),
              .count_limit_out(count_limit[i]),
              .type({valid_d[i],tlpstart[i],tlpend[i],dlpend[i],dlpstart[i],tlpedb[i]}),
              .rst(rst)  
            );  
        end
        else 
        begin
          Gen_3_check_byte CheckByte3(
            .data_in(Data_in[8*(i+1)-1:8*i]),
            .byte_count_in(count_byte[i-1]),
            .byte_header_in(header_byte[i-1]),
            .count_limit_in(count_limit[i-1]),
            .syncHeader(syncHeader1[2*(i+1)-1:2*i]),
            .valid(valid[i]),
            .byte_count_out(count_byte[i]),
            .byte_header_out(header_byte[i]),
            .count_limit_out(count_limit[i]),
            .type({valid_d[i],tlpstart[i],tlpend[i],dlpend[i],dlpstart[i],tlpedb[i]}),
            .rst(rst)  
          );    
        end  
          


      end


endgenerate

reg [26:0] data_out_reg;
always @(posedge clk) begin
    data_out_reg <= {count_byte[63],header_byte[63],count_limit[63]};
end
assign {count_byte[64],header_byte[64],count_limit[64]} = data_out_reg;

endmodule