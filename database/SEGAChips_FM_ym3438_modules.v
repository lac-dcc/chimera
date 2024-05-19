// This program was cloned from: https://github.com/emu-russia/SEGAChips
// License: Creative Commons Zero v1.0 Universal

module ym3438_NOR (  Z, A, B);

	output wire Z;
	input wire A;
	input wire B;

assign Z =  ~(A | B);

endmodule // ym3438_NOR

module ym3438_CNT_BIT (  CI, Q, C1, C2, nC1, nC2, nRES, CO);

	input wire CI;
	output wire Q;
	input wire C1;
	input wire C2;
	input wire nC1;
	input wire nC2;
	input wire nRES;
	output wire CO;

endmodule // ym3438_CNT_BIT

module ym3438_OR (  A, Z, B);

	input wire A;
	output wire Z;
	input wire B;

assign Z =  A | B;

endmodule // ym3438_OR

module ym3438_SR_BIT (  Q, D, C1, C2, nC1, nC2);

	output wire Q;
	input wire D;
	input wire C1;
	input wire C2;
	input wire nC1;
	input wire nC2;

endmodule // ym3438_SR_BIT

module ym3438_NOT (  A, nZ);

	input wire A;
	output wire nZ;

assigh nZ = ~A;

endmodule // ym3438_NOT

module ym3438_SDELAY12 (  A, C1, C2, nC1, nC2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14, C15, C16, C17, C18, C19, C20, C21, C22, C23, C24, nC3, nC4, nC5, nC6, nC7, nC8, nC9, nC10, nC11, nC12, nC13, nC14, nC15, nC16, nC17, nC18, nC19, nC20, nC21, nC22, nC23, nC24, Q);

	input wire A;
	input wire C1;
	input wire C2;
	input wire nC1;
	input wire nC2;
	input wire C3;
	input wire C4;
	input wire C5;
	input wire C6;
	input wire C7;
	input wire C8;
	input wire C9;
	input wire C10;
	input wire C11;
	input wire C12;
	input wire C13;
	input wire C14;
	input wire C15;
	input wire C16;
	input wire C17;
	input wire C18;
	input wire C19;
	input wire C20;
	input wire C21;
	input wire C22;
	input wire C23;
	input wire C24;
	input wire nC3;
	input wire nC4;
	input wire nC5;
	input wire nC6;
	input wire nC7;
	input wire nC8;
	input wire nC9;
	input wire nC10;
	input wire nC11;
	input wire nC12;
	input wire nC13;
	input wire nC14;
	input wire nC15;
	input wire nC16;
	input wire nC17;
	input wire nC18;
	input wire nC19;
	input wire nC20;
	input wire nC21;
	input wire nC22;
	input wire nC23;
	input wire nC24;
	output wire Q;

endmodule // ym3438_SDELAY12

module ym3438_AND (  A, Z, B);

	input wire A;
	output wire Z;
	input wire B;

assign Z =  A & B;

endmodule // ym3438_AND

module ym3438_AND5 (  A, Z, B, C, D, E);

	input wire A;
	output wire Z;
	input wire B;
	input wire C;
	input wire D;
	input wire E;

assign Z =  A & B & C & D & E;

endmodule // ym3438_AND5

module ym3438_COMP_WE_STRONG (  A, Z, nZ);

	input wire A;
	output wire Z;
	output wire nZ;

assigh Z  =  A;
assigh nZ = ~A;

endmodule // ym3438_COMP_WE_STRONG

module ym3438_BUF2 (  A, Z);

	input wire A;
	output wire Z;

assigh Z  =  A;

endmodule // ym3438_BUF2

module ym3438_COMP_STR (  A, Z, nZ);

	input wire A;
	output wire Z;
	output wire nZ;

endmodule // ym3438_COMP_STR

module ym3438_EDGE_DET (  C1, D, nC1, Q);

	input wire C1;
	input wire D;
	input wire nC1;
	output wire Q;

endmodule // ym3438_EDGE_DET

module ym3438_NOR4 (  A, Z, B, C, D);

	input wire A;
	output wire Z;
	input wire B;
	input wire C;
	input wire D;

ssign Z =  ~(A | B | C | D );

endmodule // ym3438_NOR4

module ym3438_OR6 (  A, Z, B, C, D, E, F);

	input wire A;
	output wire Z;
	input wire B;
	input wire C;
	input wire D;
	input wire E;
	input wire F;

assign Z =  A | B | C | D | E | F;

endmodule // ym3438_OR6

module ym3438_NOR6 (  A, Z, B, C, D, E, F);

	input wire A;
	output wire Z;
	input wire B;
	input wire C;
	input wire D;
	input wire E;
	input wire F;

assign Z =  ~(A | B | C | D | E | F);

endmodule // ym3438_NOR6

module ym3438_AOI21 (  A1, Z, B, A2);

	input wire A1;
	output wire Z;
	input wire B;
	input wire A2;

assign Z = ~((A1 & A2) | B);

endmodule // ym3438_AOI21

module ym3438_NAND (  A, Z, B);

	input wire A;
	output wire Z;
	input wire B;

assign Z = ~(A & B);

endmodule // ym3438_NAND

module ym3438_AOI2222 (  A1, Z, B1, A2, B2, C1, C2, D1, D2);

	input wire A1;
	output wire Z;
	input wire B1;
	input wire A2;
	input wire B2;
	input wire C1;
	input wire C2;
	input wire D1;
	input wire D2;

assign Z = ~((A1 & A2) | (B1 & B2) | (C1 & C2) | (D1 & D2));

endmodule // ym3438_AOI2222

module ym3438_NOR3 (  A, Z, B, C);

	input wire A;
	output wire Z;
	input wire B;
	input wire C;

assign Z =  ~(A | B | C);

endmodule // ym3438_NOR3

module ym3438_AOI22 (  A1, Z, B1, A2, B2);

	input wire A1;
	output wire Z;
	input wire B1;
	input wire A2;
	input wire B2;

assign Z = ~((A1 & A2) | (B1 & B2));

endmodule // ym3438_AOI22

module ym3438_AND3 (  A, Z, B, C);

	input wire A;
	output wire Z;
	input wire B;
	input wire C;

assign Z =  A & B & C;

endmodule // ym3438_AND3

module ym3438_OR3 (  A, Z, B, C);

	input wire A;
	output wire Z;
	input wire B;
	input wire C;

assign Z =  A | B | C;

endmodule // ym3438_OR3

module ym3438_OR4 (  A, Z, B, C, D);

	input wire A;
	output wire Z;
	input wire B;
	input wire C;
	input wire D;

assign Z =  A | B | C | D;

endmodule // ym3438_OR4

module ym3438_OR5 (  A, Z, B, C, D, E);

	input wire A;
	output wire Z;
	input wire B;
	input wire C;
	input wire D;
	input wire E;

assign Z =  A | B | C | D | E;

endmodule // ym3438_OR5

module ym3438_COMP_WE (  A, Z, nZ);

	input wire A;
	output wire Z;
	output wire nZ;

assigh Z  =  A;
assigh nZ = ~A;

endmodule // ym3438_COMP_WE

module ym3438_FA (  CO, S, CI, A, B);

	output wire CO;
	output wire S;
	input wire CI;
	input wire A;
	input wire B;

assign S  = (A ^ B) ^ CI;
assign CO = (A & B) | ((A ^ B) & CI);

endmodule // ym3438_FA

module ym3438_SDELAY6 (  A, C1, C2, nC1, nC2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, nC3, nC4, nC5, nC6, nC7, nC8, nC9, nC10, nC11, nC12, Q);

	input wire A;
	input wire C1;
	input wire C2;
	input wire nC1;
	input wire nC2;
	input wire C3;
	input wire C4;
	input wire C5;
	input wire C6;
	input wire C7;
	input wire C8;
	input wire C9;
	input wire C10;
	input wire C11;
	input wire C12;
	input wire nC3;
	input wire nC4;
	input wire nC5;
	input wire nC6;
	input wire nC7;
	input wire nC8;
	input wire nC9;
	input wire nC10;
	input wire nC11;
	input wire nC12;
	output wire Q;

endmodule // ym3438_SDELAY6

module ym3438_AON22 (  A1, Z, B2, A2, B1);

	input wire A1;
	output wire Z;
	input wire B2;
	input wire A2;
	input wire B1;

assign Z = (A1 & A2) | (B1 & B2);

endmodule // ym3438_AON22

module ym3438_SLATCH (  Q, nQ, D, nC, C);

	output wire Q;
	output wire nQ;
	input wire D;
	input wire nC;
	input wire C;

endmodule // ym3438_SLATCH

module ym3438_CELL50 (  A, Z, B);

	input wire A;
	output wire Z;
	input wire B;

endmodule // ym3438_CELL50

module ym3438_TRI (  A, Z, E);

	input wire A;
	output wire Z;
	input wire E;

endmodule // ym3438_TRI

module ym3438_NOR5 (  Z, B, A, C, D, E);

	output wire Z;
	input wire B;
	input wire A;
	input wire C;
	input wire D;
	input wire E;

assign Z =  ~(A | B | C | D | E);

endmodule // ym3438_NOR5

module ym3438_AND6 (  Z, B, A, C, D, E, F);

	output wire Z;
	input wire B;
	input wire A;
	input wire C;
	input wire D;
	input wire E;
	input wire F;

assign Z =  A & B & C & D & E & F;

endmodule // ym3438_AND6

module ym3438_AND7 (  Z, B, A, C, D, E, F, G);

	output wire Z;
	input wire B;
	input wire A;
	input wire C;
	input wire D;
	input wire E;
	input wire F;
	input wire G;

assign Z =  A & B & C & D & E & F & G;

endmodule // ym3438_AND7

module ym3438_XOR (  A, Z, B);

	input wire A;
	output wire Z;
	input wire B;

assign Z = A ^ B;

endmodule // ym3438_XOR

module ym3438_AON32 (  A1, Z, B2, A2, B1, A3);

	input wire A1;
	output wire Z;
	input wire B2;
	input wire A2;
	input wire B1;
	input wire A3;

assign Z = (A1 & A2 & A3) | (B1 & B2);

endmodule // ym3438_AON32

module ym3438_CNT_BIT_LOAD (  CI, C1, C2, nC1, nC2, nRES, CO, D, L, nL);

	input wire CI;
	input wire C1;
	input wire C2;
	input wire nC1;
	input wire nC2;
	input wire nRES;
	output wire CO;
	input wire D;
	input wire L;
	input wire nL;

endmodule // ym3438_CNT_BIT_LOAD

module ym3438_AON222 (  A1, Z, B2, A2, B1, C1, C2);

	input wire A1;
	output wire Z;
	input wire B2;
	input wire A2;
	input wire B1;
	input wire C1;
	input wire C2;

assign Z = (A1 & A2) | (B1 & B2) | (C1 & C2);

endmodule // ym3438_AON222

module ym3438_AON2222 (  A1, Z, B2, A2, B1, C1, C2, D1, D2);

	input wire A1;
	output wire Z;
	input wire B2;
	input wire A2;
	input wire B1;
	input wire C1;
	input wire C2;
	input wire D1;
	input wire D2;

assign Z = (A1 & A2) | (B1 & B2) | (C1 & C2) | (D1 & D2);

endmodule // ym3438_AON2222

module ym3438_HA (  CO, S, A, B);

	output wire CO;
	output wire S;
	input wire A;
	input wire B;

assign S =  A ^ B;
assign CO = A & B;

endmodule // ym3438_HA

module ym3438_NAND4 (  Z, B, A, C, D);

	output wire Z;
	input wire B;
	input wire A;
	input wire C;
	input wire D;

assign Z = ~( A & B & C & D );

endmodule // ym3438_NAND4

module ym3438_AON22222222 (  A1, Z, B2, A2, B1, C1, C2, D1, D2, E1, E2, F1, F2, G1, G2, H1, H2);

	input wire A1;
	output wire Z;
	input wire B2;
	input wire A2;
	input wire B1;
	input wire C1;
	input wire C2;
	input wire D1;
	input wire D2;
	input wire E1;
	input wire E2;
	input wire F1;
	input wire F2;
	input wire G1;
	input wire G2;
	input wire H1;
	input wire H2;

assign Z = (A1 & A2) | (B1 & B2) | (C1 & C2) | (D1 & D2) | (E1 & E2) | (F1 & F2) | (G1 & G2) | (H1 & H2);

endmodule // ym3438_AON22222222

module ym3438_AOI222222 (  A1, Z, B2, A2, B1, C1, C2, D1, D2, E1, E2, F1, F2);

	input wire A1;
	output wire Z;
	input wire B2;
	input wire A2;
	input wire B1;
	input wire C1;
	input wire C2;
	input wire D1;
	input wire D2;
	input wire E1;
	input wire E2;
	input wire F1;
	input wire F2;

assign Z = ~((A1 & A2) | (B1 & B2) | (C1 & C2) | (D1 & D2) | (E1 & E2) | (F1 & F2));

endmodule // ym3438_AOI222222

module ym3438_SDELAY5 (  A, C1, C2, nC1, nC2, C3, C4, C5, C6, C7, C8, C9, C10, nC3, nC4, nC5, nC6, nC7, nC8, nC9, nC10, Q);

	input wire A;
	input wire C1;
	input wire C2;
	input wire nC1;
	input wire nC2;
	input wire C3;
	input wire C4;
	input wire C5;
	input wire C6;
	input wire C7;
	input wire C8;
	input wire C9;
	input wire C10;
	input wire nC3;
	input wire nC4;
	input wire nC5;
	input wire nC6;
	input wire nC7;
	input wire nC8;
	input wire nC9;
	input wire nC10;
	output wire Q;

endmodule // ym3438_SDELAY5

module ym3438_EXPONENT_TABLE (  D12, D11, D10, D9, D8, D7, D6, D5, D4, D3, D2, D1, D0, CA3, CA2, CA1, CA0, RA1, RA0, RA3, RA2, RA4);

	output wire D12;
	output wire D11;
	output wire D10;
	output wire D9;
	output wire D8;
	output wire D7;
	output wire D6;
	output wire D5;
	output wire D4;
	output wire D3;
	output wire D2;
	output wire D1;
	output wire D0;
	input wire CA3;
	input wire CA2;
	input wire CA1;
	input wire CA0;
	input wire RA1;
	input wire RA0;
	input wire RA3;
	input wire RA2;
	input wire RA4;

endmodule // ym3438_EXPONENT_TABLE

module ym3438_SINE_TABLE (  D10, D9, D8, D11, D3, D2, D1, D0, D7, D6, D5, D4, D12, D13, D14, D15, D16, D17, D18, CA3, CA2, CA1, CA0, RA1, RA0, RA3, RA2, RA4);

	output wire D10;
	output wire D9;
	output wire D8;
	output wire D11;
	output wire D3;
	output wire D2;
	output wire D1;
	output wire D0;
	output wire D7;
	output wire D6;
	output wire D5;
	output wire D4;
	output wire D12;
	output wire D13;
	output wire D14;
	output wire D15;
	output wire D16;
	output wire D17;
	output wire D18;
	input wire CA3;
	input wire CA2;
	input wire CA1;
	input wire CA0;
	input wire RA1;
	input wire RA0;
	input wire RA3;
	input wire RA2;
	input wire RA4;

endmodule // ym3438_SINE_TABLE

module ym3438_SR_BITi (  nQ, D, nC1, nC2, C1, C2);

	output wire nQ;
	input wire D;
	input wire nC1;
	input wire nC2;
	input wire C1;
	input wire C2;

endmodule // ym3438_SR_BITi

module ym3438_not (  nZ, A);

	output wire nZ;
	input wire A;

assign nZ = ~A; 

endmodule // ym3438_not

module ym3438_DLATCH_INV (  nQ, D, C, nC);

	output wire nQ;
	input wire D;
	input wire C;
	input wire nC;

endmodule // ym3438_DLATCH_INV

module ym3438_SDELAY23 (  A, C1, C2, nC1, nC2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14, C15, C16, C17, C18, C19, C20, C21, C22, C23, C24, nC3, nC4, nC5, nC6, nC7, nC8, nC9, nC10, nC11, nC12, nC13, nC14, nC15, nC16, nC17, nC18, nC19, nC20, nC21, nC22, nC23, nC24, Q, C25, C26, C27, C28, C29, C30, nC25, nC26, nC27, nC28, nC29, nC30, C36, nC36, C35, nC35, C34, nC34, C33, nC33, C32, nC32, C31, nC31, C42, nC42, C41, nC41, C40, nC40, C39, nC39, C38, nC38, C37, nC37, C44, nC44, C43, nC43, C46, nC46, C45, nC45, Q42);

	input wire A;
	input wire C1;
	input wire C2;
	input wire nC1;
	input wire nC2;
	input wire C3;
	input wire C4;
	input wire C5;
	input wire C6;
	input wire C7;
	input wire C8;
	input wire C9;
	input wire C10;
	input wire C11;
	input wire C12;
	input wire C13;
	input wire C14;
	input wire C15;
	input wire C16;
	input wire C17;
	input wire C18;
	input wire C19;
	input wire C20;
	input wire C21;
	input wire C22;
	input wire C23;
	input wire C24;
	input wire nC3;
	input wire nC4;
	input wire nC5;
	input wire nC6;
	input wire nC7;
	input wire nC8;
	input wire nC9;
	input wire nC10;
	input wire nC11;
	input wire nC12;
	input wire nC13;
	input wire nC14;
	input wire nC15;
	input wire nC16;
	input wire nC17;
	input wire nC18;
	input wire nC19;
	input wire nC20;
	input wire nC21;
	input wire nC22;
	input wire nC23;
	input wire nC24;
	output wire Q;
	input wire C25;
	input wire C26;
	input wire C27;
	input wire C28;
	input wire C29;
	input wire C30;
	input wire nC25;
	input wire nC26;
	input wire nC27;
	input wire nC28;
	input wire nC29;
	input wire nC30;
	input wire C36;
	input wire nC36;
	input wire C35;
	input wire nC35;
	input wire C34;
	input wire nC34;
	input wire C33;
	input wire nC33;
	input wire C32;
	input wire nC32;
	input wire C31;
	input wire nC31;
	input wire C42;
	input wire nC42;
	input wire C41;
	input wire nC41;
	input wire C40;
	input wire nC40;
	input wire C39;
	input wire nC39;
	input wire C38;
	input wire nC38;
	input wire C37;
	input wire nC37;
	input wire C44;
	input wire nC44;
	input wire C43;
	input wire nC43;
	input wire C46;
	input wire nC46;
	input wire C45;
	input wire nC45;
	output wire Q42;

endmodule // ym3438_SDELAY23

module ym3438_AOI221 (  Z, B2, B1, A, C2, C1);

	output wire Z;
	input wire B2;
	input wire B1;
	input wire A;
	input wire C2;
	input wire C1;

assign Z = ~( A | (B1 & B2) | (C1 & C2) );

endmodule // ym3438_AOI221

module ym3438_AOI33 (  A1, Z, B2, A2, B1, A3, B3);

	input wire A1;
	output wire Z;
	input wire B2;
	input wire A2;
	input wire B1;
	input wire A3;
	input wire B3;

assign Z = ~((A1 & A2 & A3) | (B1 & B2 & B3));

endmodule // ym3438_AOI33

module ym3438_AOI333 (  A1, Z, B2, A2, B1, A3, B3, C2, C1, C3);

	input wire A1;
	output wire Z;
	input wire B2;
	input wire A2;
	input wire B1;
	input wire A3;
	input wire B3;
	input wire C2;
	input wire C1;
	input wire C3;

assign Z = ~((A1 & A2 & A3) | (B1 & B2 & B3) | (C1 & C2 & C3));

endmodule // ym3438_AOI333

module ym3438_AON3333 (  A1, Z, B2, A2, B1, A3, B3, C1, D2, C2, D1, C3, D3);

	input wire A1;
	output wire Z;
	input wire B2;
	input wire A2;
	input wire B1;
	input wire A3;
	input wire B3;
	input wire C1;
	input wire D2;
	input wire C2;
	input wire D1;
	input wire C3;
	input wire D3;

assign Z = (A1 & A2 & A3) | (B1 & B2 & B3) | (C1 & C2 & C3) | (D1 & D2 & D3);

endmodule // ym3438_AON3333

module ym3438_DLATCH_INVS (  D, C, nC, nQ);

	input wire D;
	input wire C;
	input wire nC;
	output wire nQ;

endmodule // ym3438_DLATCH_INVS

module ym3438_AON21SR (  Q, nC2, C2, nC1, C1, B, A2, A1);

	output wire Q;
	input wire nC2;
	input wire C2;
	input wire nC1;
	input wire C1;
	input wire B;
	input wire A2;
	input wire A1;

endmodule // ym3438_AON21SR

module ym3438_AND4 (  Z, B, A, C, D);

	output wire Z;
	input wire B;
	input wire A;
	input wire C;
	input wire D;

assign Z =  A & B & C & D; 

endmodule // ym3438_AND4

module ym3438_NAND5 (  Z, B, A, C, D, E);

	output wire Z;
	input wire B;
	input wire A;
	input wire C;
	input wire D;
	input wire E;

assign Z = ~( A & B & C & D & E );

endmodule // ym3438_NAND5

module ym3438_AON33 (  A1, Z, B2, A2, B1, A3, B3);

	input wire A1;
	output wire Z;
	input wire B2;
	input wire A2;
	input wire B1;
	input wire A3;
	input wire B3;

assign Z = (A1 & A2 & A3) | (B1 & B2 & B3);

endmodule // ym3438_AON33

module ym3438_AON333 (  A1, Z, B2, A2, B1, A3, B3, C1, C2, C3);

	input wire A1;
	output wire Z;
	input wire B2;
	input wire A2;
	input wire B1;
	input wire A3;
	input wire B3;
	input wire C1;
	input wire C2;
	input wire C3;

assign Z = (A1 & A2 & A3) | (B1 & B2 & B3) | (C1 & C2 & C3);

endmodule // ym3438_AON333

module ym3438_SDELAY24 (  A, C1, C2, nC1, nC2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14, C15, C16, C17, C18, C19, C20, C21, C22, C23, C24, nC3, nC4, nC5, nC6, nC7, nC8, nC9, nC10, nC11, nC12, nC13, nC14, nC15, nC16, nC17, nC18, nC19, nC20, nC21, nC22, nC23, nC24, Q, C25, C26, C27, C28, C29, C30, nC25, nC26, nC27, nC28, nC29, nC30, C36, nC36, C35, nC35, C34, nC34, C33, nC33, C32, nC32, C31, nC31, C42, nC42, C41, nC41, C40, nC40, C39, nC39, C38, nC38, C37, nC37, C44, nC44, C43, nC43, C46, nC46, C45, nC45, Q44, C47, nC48, C47, nC47);

	input wire A;
	input wire C1;
	input wire C2;
	input wire nC1;
	input wire nC2;
	input wire C3;
	input wire C4;
	input wire C5;
	input wire C6;
	input wire C7;
	input wire C8;
	input wire C9;
	input wire C10;
	input wire C11;
	input wire C12;
	input wire C13;
	input wire C14;
	input wire C15;
	input wire C16;
	input wire C17;
	input wire C18;
	input wire C19;
	input wire C20;
	input wire C21;
	input wire C22;
	input wire C23;
	input wire C24;
	input wire nC3;
	input wire nC4;
	input wire nC5;
	input wire nC6;
	input wire nC7;
	input wire nC8;
	input wire nC9;
	input wire nC10;
	input wire nC11;
	input wire nC12;
	input wire nC13;
	input wire nC14;
	input wire nC15;
	input wire nC16;
	input wire nC17;
	input wire nC18;
	input wire nC19;
	input wire nC20;
	input wire nC21;
	input wire nC22;
	input wire nC23;
	input wire nC24;
	output wire Q;
	input wire C25;
	input wire C26;
	input wire C27;
	input wire C28;
	input wire C29;
	input wire C30;
	input wire nC25;
	input wire nC26;
	input wire nC27;
	input wire nC28;
	input wire nC29;
	input wire nC30;
	input wire C36;
	input wire nC36;
	input wire C35;
	input wire nC35;
	input wire C34;
	input wire nC34;
	input wire C33;
	input wire nC33;
	input wire C32;
	input wire nC32;
	input wire C31;
	input wire nC31;
	input wire C42;
	input wire nC42;
	input wire C41;
	input wire nC41;
	input wire C40;
	input wire nC40;
	input wire C39;
	input wire nC39;
	input wire C38;
	input wire nC38;
	input wire C37;
	input wire nC37;
	input wire C44;
	input wire nC44;
	input wire C43;
	input wire nC43;
	input wire C46;
	input wire nC46;
	input wire C45;
	input wire nC45;
	output wire Q44;
	input wire C47;
	input wire nC48;
	input wire C47;
	input wire nC47;

endmodule // ym3438_SDELAY24

module ym3438_NAND3 (  Z, B, A, C);

	output wire Z;
	input wire B;
	input wire A;
	input wire C;

assign Z = ~( A & B & C );

endmodule // ym3438_NAND3

module ym3438_SB_BIT (  D, C1, C2, nC1, nC2, Q);

	input wire D;
	input wire C1;
	input wire C2;
	input wire nC1;
	input wire nC2;
	output wire Q;



endmodule // ym3438_SB_BIT

module ym3438_SRFF (  Q, nQ, S, R);

	output wire Q;
	output wire nQ;
	input wire S;
	input wire R;

endmodule // ym3438_SRFF

module ym3438_SYNC_SRFF (  Q, nQ, C, S, R);

	output wire Q;
	output wire nQ;
	input wire C;
	input wire S;
	input wire R;

endmodule // ym3438_SYNC_SRFF

module ym3438_AON222222 (  A2, B1, A1, Z, B2, C1, C2, D1, D2, E1, E2, F1, F2);

	input wire A2;
	input wire B1;
	input wire A1;
	output wire Z;
	input wire B2;
	input wire C1;
	input wire C2;
	input wire D1;
	input wire D2;
	input wire E1;
	input wire E2;
	input wire F1;
	input wire F2;

assign Z = (A1 & A2) | (B1 & B2) | (C1 & C2) | (D1 & D2) | (E1 & E2) | (F1 & F2);

endmodule // ym3438_AON222222

module ym3438_NAND7 (  A, Z, B, G, D, F, C, E);

	input wire A;
	output wire Z;
	input wire B;
	input wire G;
	input wire D;
	input wire F;
	input wire C;
	input wire E;

assign Z = ~( A & B & C & D & E );

endmodule // ym3438_NAND7

module ym3438_OR7 (  Z, B, A, C, D, E, F, G);

	output wire Z;
	input wire B;
	input wire A;
	input wire C;
	input wire D;
	input wire E;
	input wire F;
	input wire G;

assign Z = A | B | C | D | E | F | G ;

endmodule // ym3438_OR7

module ym3438_FA_SEQ (  C1, C2, nC1, nC2, CO, Q, CI, A, B);

	input wire C1;
	input wire C2;
	input wire nC1;
	input wire nC2;
	output wire CO;
	output wire Q;
	input wire CI;
	input wire A;
	input wire B;

wire S;
assign S  = (A ^ B) ^ CI;
assign CO = (A & B) | ((A ^ B) & CI);

endmodule // ym3438_FA_SEQ

module ym3438_AOI222 (  A2, A1, Z, B2, C1, C2, B1);

	input wire A2;
	input wire A1;
	output wire Z;
	input wire B2;
	input wire C1;
	input wire C2;
	input wire B1;

assign Z = ~((A1 & A2) | (B1 & B2) | (C1 & C2));

endmodule // ym3438_AOI222

module ym3438_XNOR (  Z, B, A);

	output wire Z;
	input wire B;
	input wire A;

assign Z = ~(A ^ B);

endmodule // ym3438_XNOR

module ym3438_OR8 (  Z, B, A, C, D, E, F, G, H);

	output wire Z;
	input wire B;
	input wire A;
	input wire C;
	input wire D;
	input wire E;
	input wire F;
	input wire G;
	input wire H;

assign Z = A | B | C | D | E | F | G | H;

endmodule // ym3438_OR8

