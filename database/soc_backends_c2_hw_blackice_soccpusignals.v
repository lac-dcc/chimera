// This program was cloned from: https://github.com/combinatorylogic/soc
// License: MIT License

//none
output reg data_we_cpu,
output reg data_rq_cpu,
input  grant_cpu,
output reg [17:0] sram_adr_cpu,
input  [15:0] sram_in,
output reg [15:0] sram_out,
output reg vgaenable,

`ifdef ENABLE_SOUND
input sound_clr_full,
output reg [15:0] sound_clr_sample,
output reg [15:0] sound_clr_rate,
output reg sound_clr_req,
`endif



           
