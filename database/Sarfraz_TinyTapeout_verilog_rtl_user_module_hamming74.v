// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

module hm_enc( input wire [3:0] in, output wire[6:0] out);
   assign out[0] = in[0] ^ in[1] ^ in[3];
   assign out[1] = in[0] ^ in[2] ^ in[3];
   assign out[2] = in[0];
   assign out[3] = in[1] ^ in[2] ^ in[3];
   assign out[4] = in[1];
   assign out[5] = in[2];
   assign out[6] = in[3];
endmodule // hm_enc

module hm_dec (
               input [6:0]  recv,
               output [3:0] infoword,
               output [2:0] syndrome
               );
   wire [3:0] systematic = {recv[6], recv[5], recv[4], recv[2]};
   assign syndrome = {
                      recv[0] ^ recv[2] ^ recv[4] ^ recv[6], // A
                      recv[1] ^ recv[2] ^ recv[5] ^ recv[6], // B
                      recv[3] ^ recv[4] ^ recv[5] ^ recv[6]  // C
                      };
   assign infoword = (syndrome == 3'b0) ?  systematic :
                     (syndrome == 3'b110 ) ? {recv[6], recv[5], recv[4], ~recv[2]}:
                     (syndrome == 3'b101 ) ? {recv[6], recv[5], ~recv[4], recv[2]}:
                     (syndrome == 3'b011 ) ? {recv[6], ~recv[5], recv[4], recv[2]}:
                     (syndrome == 3'b111 ) ? {~recv[6], recv[5], recv[4], recv[2]}:
                     systematic; // yeah, best we'll do.
endmodule


module user_module_hamming74
  (
   input wire [7:0]  io_in,
   output wire [7:0] io_out
   );
   wire [6:0]        encoded;
   wire [3:0]        decoded;
   wire [2:0]        syndrome;

   wire [3:0]        info = io_in[3:0];
   wire [6:0]        codeword = io_in[6:0];
   wire              enc_dec = io_in[7];

   hm_enc encoder (.in(info), .out(encoded));
   hm_dec decoder (.recv(codeword), .infoword(decoded), .syndrome(syndrome));

   assign io_out[6:0] = enc_dec ? encoded : {syndrome , decoded};

endmodule // user_module_hm
