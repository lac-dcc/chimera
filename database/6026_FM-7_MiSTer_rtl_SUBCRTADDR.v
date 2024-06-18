// This program was cloned from: https://github.com/pcornier/FM-7_MiSTer
// License: GNU General Public License v2.0


module SUBCRTADDR(
  input SDRAMV1n,
  input SDRAMV2n,
  input SDRAMV3n,
  input SBLANKn,
  input SCASSEL,
  input SRWB,
  output SVCASBn,
  output SVCASRn,
  output SVCASGn,
  output SVWEn,
  output SADRSEL
);

assign SVCASBn = SBLANKn & SDRAMV1n & SCASSEL;
assign SVCASRn = SBLANKn & SDRAMV2n & SCASSEL;
assign SVCASGn = SBLANKn & SDRAMV3n & SCASSEL;

assign SVWEn = ~SBLANKn ? SRWB : 1'b1;

assign SADRSEL = SDRAMV1n & SDRAMV2n & SDRAMV3n;

// M59 is supposed to disable SCPU writes (SCPUWEn=1) when SBLANK=1
// and mux SCPU/SVD RAS/CAS signals based on SBLANK

endmodule
