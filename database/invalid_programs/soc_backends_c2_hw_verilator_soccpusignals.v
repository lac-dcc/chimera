

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
