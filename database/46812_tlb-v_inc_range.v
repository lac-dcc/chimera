// This program was cloned from: https://github.com/Naminar/tlb-v
// License: MIT License

`ifndef RANGE_V
`define RANGE_V

`define VALIDE_BIT [SADDR-$clog2(NSET)-SPAGE+SPCID+SADDR-SPAGE]
`define TAG_RANGE [SADDR-$clog2(NSET)-SPAGE+SPCID+SADDR-SPAGE-1:SPCID+SADDR-SPAGE]
`define PCID_RANGE [SPCID+SADDR-SPAGE-1:SADDR-SPAGE]
`define PA_RANGE [SADDR-SPAGE-1:0]

`endif // RANGE_V