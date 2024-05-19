// This program was cloned from: https://github.com/combinatorylogic/soc
// License: MIT License


output reg vmem_we,
output reg vmem_re,
output reg [7:0] vmem_in_data,
input      [7:0] vmem_p1_out_data,
output reg [19:0] vmem_in_addr,           
output reg vmem_select,
output reg vga_clsrq,
input vga_clsack,
           
input vga_scan,

output reg vmem_bufswap,           

`ifdef ENABLE_SOUND
input sound_clr_full,
output reg [15:0] sound_clr_sample,
output reg [15:0] sound_clr_rate,
output reg sound_clr_req,
`endif
