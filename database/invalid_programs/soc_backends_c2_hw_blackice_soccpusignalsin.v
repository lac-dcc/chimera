.data_we_cpu(data_we_cpu),
.data_rq_cpu(data_rq_cpu),
.grant_cpu(grant_cpu),
.sram_adr_cpu(sram_adr_cpu),
.sram_in(sram_in),
.sram_out(sram_out),
.vgaenable(vgaenable),

`ifdef ENABLE_SOUND
.sound_clr_full(sound_clr_full),
.sound_clr_sample(sound_clr_sample),
.sound_clr_rate(sound_clr_rate),
.sound_clr_req(sound_clr_req),
`endif
