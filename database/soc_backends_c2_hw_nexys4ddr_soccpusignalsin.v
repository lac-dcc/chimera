// This program was cloned from: https://github.com/combinatorylogic/soc
// License: MIT License


.vmem_we(vmem_we),
.vmem_re(vmem_re),
.vmem_in_data(vmem_in_data),
.vmem_p1_out_data(vmem_p1_out_data),
.vmem_in_addr(vmem_in_addr),
.vmem_select(vmem_select),

.vga_clsrq(vga_clsrq),
.vga_clsack(vga_clsack),

.vga_scan(vga_scan),
.vmem_bufswap(vmem_bufswap),


`ifdef ENABLE_SOUND
.sound_clr_full(sound_clr_full),
.sound_clr_sample(sound_clr_sample),
.sound_clr_rate(sound_clr_rate),
.sound_clr_req(sound_clr_req),
`endif
