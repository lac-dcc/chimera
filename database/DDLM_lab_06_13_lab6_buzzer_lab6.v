// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

module tone_gen
#( 
   parameter ref_clock     = 50000000,
   parameter out_freq_x100 = 26163
)
  
(
 input      clk,
 input      rst_n,
 output reg tone_freq
);
  
  localparam samp_rate = ref_clock*100/out_freq_x100;
  
  reg [31:0] cnt;
  
  always@(posedge clk or negedge rst_n)
    if(!rst_n)
      begin
        cnt       <= 16'b0;
        tone_freq <= 0;
      end
    else if(cnt == samp_rate / 2 - 1 )
      begin
        cnt       <= 16'b0;
        tone_freq <= !tone_freq;
      end
    else
      begin
        cnt       <= cnt + 16'b1;
        tone_freq <= tone_freq;
      end
     
        
  
endmodule // tone_gen
