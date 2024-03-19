module LFSR_8(scrambler_reset, reset_n, pclk, data_out);

  input scrambler_reset, reset_n, pclk;
  
  output wire [7:0] data_out;

  reg [15:0] lfsr_q, lfsr_c;
  reg [7:0] data_c;

  always @(*) begin

	if(scrambler_reset)
      lfsr_q <= 16'hFFFF;

    lfsr_c[0] = lfsr_q[ 8];
    lfsr_c[1] = lfsr_q[ 9];
    lfsr_c[2] = lfsr_q[10];
    lfsr_c[3] = lfsr_q[ 8] ^ lfsr_q[11];
    lfsr_c[4] = lfsr_q[ 8] ^ lfsr_q[ 9] ^ lfsr_q[12];
    lfsr_c[5] = lfsr_q[ 8] ^ lfsr_q[ 9] ^ lfsr_q[10] ^ lfsr_q[13];
    lfsr_c[6] = lfsr_q[ 9] ^ lfsr_q[10] ^ lfsr_q[11] ^ lfsr_q[14];
    lfsr_c[7] = lfsr_q[10] ^ lfsr_q[11] ^ lfsr_q[12] ^ lfsr_q[15];
    lfsr_c[8] = lfsr_q[ 0] ^ lfsr_q[11] ^ lfsr_q[12] ^ lfsr_q[13];
    lfsr_c[9] = lfsr_q[ 1] ^ lfsr_q[12] ^ lfsr_q[13] ^ lfsr_q[14];
    lfsr_c[10] = lfsr_q[2] ^ lfsr_q[13] ^ lfsr_q[14] ^ lfsr_q[15];
    lfsr_c[11] = lfsr_q[3] ^ lfsr_q[14] ^ lfsr_q[15];
    lfsr_c[12] = lfsr_q[4] ^ lfsr_q[15];
    lfsr_c[13] = lfsr_q[5];
    lfsr_c[14] = lfsr_q[6];
    lfsr_c[15] = lfsr_q[7];

    data_c[0] = lfsr_q[15];
    data_c[1] = lfsr_q[14];
    data_c[2] = lfsr_q[13];
    data_c[3] = lfsr_q[12];
    data_c[4] = lfsr_q[11];
    data_c[5] = lfsr_q[10];
    data_c[6] = lfsr_q[9];
    data_c[7] = lfsr_q[8];

  end

  always @(posedge pclk or negedge reset_n)
    if(~reset_n) 
      lfsr_q <= 16'hFFFF; 
    else
      lfsr_q <= lfsr_c ;

	assign data_out = data_c;

endmodule