module LFSR_8_gen3(seedValue, scrambler_reset, reset_n, pclk, data_out);

  input [23:0] seedValue;
  input scrambler_reset, reset_n, pclk;

  output wire [7:0] data_out;

  reg [22:0] lfsr_q,lfsr_c;
  reg [7:0] data_c;

  always @(*) begin

    if(scrambler_reset)
       lfsr_q <= seedValue; 

    lfsr_c[0] = lfsr_q[15] ^  lfsr_q[17] ^ lfsr_q[19] ^ lfsr_q[21] ^ lfsr_q[22];
    lfsr_c[1] = lfsr_q[16] ^  lfsr_q[18] ^ lfsr_q[20] ^ lfsr_q[22];
    lfsr_c[2] = lfsr_q[15] ^  lfsr_q[22];
    lfsr_c[3] = lfsr_q[16];
    lfsr_c[4] = lfsr_q[17];
    lfsr_c[5] = lfsr_q[15] ^  lfsr_q[17] ^ lfsr_q[18] ^ lfsr_q[19] ^ lfsr_q[21] ^ lfsr_q[22];
    lfsr_c[6] = lfsr_q[16] ^  lfsr_q[18] ^ lfsr_q[19] ^ lfsr_q[20] ^ lfsr_q[22];
    lfsr_c[7] = lfsr_q[17] ^  lfsr_q[19] ^ lfsr_q[20] ^ lfsr_q[21];
    lfsr_c[8] =  lfsr_q[0] ^  lfsr_q[15] ^ lfsr_q[17] ^ lfsr_q[18] ^ lfsr_q[19] ^ lfsr_q[20];
    lfsr_c[9] =  lfsr_q[1] ^  lfsr_q[16] ^ lfsr_q[18] ^ lfsr_q[19] ^ lfsr_q[20] ^ lfsr_q[21];
    lfsr_c[10] = lfsr_q[2] ^  lfsr_q[17] ^ lfsr_q[19] ^ lfsr_q[20] ^ lfsr_q[21] ^ lfsr_q[22];
    lfsr_c[11] = lfsr_q[3] ^  lfsr_q[18] ^ lfsr_q[20] ^ lfsr_q[21] ^ lfsr_q[22];
    lfsr_c[12] = lfsr_q[4] ^  lfsr_q[19] ^ lfsr_q[21] ^ lfsr_q[22];
    lfsr_c[13] = lfsr_q[5] ^  lfsr_q[20] ^ lfsr_q[22];
    lfsr_c[14] = lfsr_q[6] ^  lfsr_q[21];
    lfsr_c[15] = lfsr_q[7] ^  lfsr_q[22];
    lfsr_c[16] = lfsr_q[8] ^  lfsr_q[15] ^ lfsr_q[17] ^ lfsr_q[19] ^ lfsr_q[21] ^ lfsr_q[22];
    lfsr_c[17] = lfsr_q[9] ^  lfsr_q[16] ^ lfsr_q[18] ^ lfsr_q[20] ^ lfsr_q[22];
    lfsr_c[18] = lfsr_q[10] ^ lfsr_q[17] ^ lfsr_q[19] ^ lfsr_q[21];
    lfsr_c[19] = lfsr_q[11] ^ lfsr_q[18] ^ lfsr_q[20] ^ lfsr_q[22];
    lfsr_c[20] = lfsr_q[12] ^ lfsr_q[19] ^ lfsr_q[21];
    lfsr_c[21] = lfsr_q[13] ^ lfsr_q[15] ^ lfsr_q[17] ^ lfsr_q[19] ^ lfsr_q[20] ^ lfsr_q[21];
    lfsr_c[22] = lfsr_q[14] ^ lfsr_q[16] ^ lfsr_q[18] ^ lfsr_q[20] ^ lfsr_q[21] ^ lfsr_q[22];

    data_c[0] = lfsr_q[22];
    data_c[1] = lfsr_q[21];
    data_c[2] = lfsr_q[20] ^ lfsr_q[22];
    data_c[3] = lfsr_q[19] ^ lfsr_q[21];
    data_c[4] = lfsr_q[18] ^ lfsr_q[20] ^ lfsr_q[22];
    data_c[5] = lfsr_q[17] ^ lfsr_q[19] ^ lfsr_q[21];
    data_c[6] = lfsr_q[16] ^ lfsr_q[18] ^ lfsr_q[20] ^ lfsr_q[22];
    data_c[7] = lfsr_q[15] ^ lfsr_q[17] ^ lfsr_q[19] ^ lfsr_q[21] ^ lfsr_q[22];
  end

  always @(posedge pclk or negedge reset_n) begin

    if(~reset_n) 
      lfsr_q <= seedValue; 
    else
      lfsr_q <= lfsr_c ;

  end

  assign data_out = data_c;



endmodule