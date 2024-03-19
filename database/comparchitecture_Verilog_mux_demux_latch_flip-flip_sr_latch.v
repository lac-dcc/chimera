module sr_latch
(
input s,
input r,
output q,
output q_n
);
assign q = ~ ( r | q_n );
assign q_n = ~ ( s | q );
endmodule