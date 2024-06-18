// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>csconvert18a
 * @file csconvert18a.v
 * @author Andrey Filippov     
 *
 * @brief  Color space converter (bayer-> YCbCr 4:2:1) for JPEG compressor.
 * Uses 18x18 pixel overlapping macroblocks for color conversion.
 *
 * @copyright Copyright (c) 2002-2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * csconvert18a.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * csconvert18a.v is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/> .
 *
 * Additional permission under GNU GPL version 3 section 7:
 * If you modify this Program, or any covered work, by linking or combining it
 * with independent modules provided by the FPGA vendor only (this permission
 * does not extend to any 3-rd party modules, "soft cores" or macros) under
 * different license terms solely for the purpose of generating binary "bitstream"
 * files and/or simulating the code, the copyright holders of this Program give
 * you the right to distribute the covered work without those independent modules
 * as long as the source code for them is available from the FPGA vendor free of
 * charge, and there is no dependence on any encrypted modules for simulating of
 * the combined code. This permission applies to you if the distributed code
 * contains all the components and scripts required to completely simulate it
 * with at least one of the Free Software programs.
 */
// 2015: Updating for 393, removing old SRL16 primitives
/*
09/07/2002 Andrey Filippov
Compared to spreadsheet simulation. Y - matches, CbCr in ~25% give result one less than spreadsheet simulation.
It is always odd and s.s. gives next even
TODO: optimize sequencing counters and possibly add some extra bits - as to calculate int((a+b+c+d)/4)
instead of int((int((a+b)/2)+int((c+d)/2))/2) 

  Color space converter processes one MCU at a time. It receives 18x18 8-bit bayer pixels (now it is always in (GR/BG)
sequence). With some latency it will produce 16x16x8 bit Y data (could be some artifacts on the borders) in scan-line
sequence and clock rate and Cb and Cr at the same time at half rate, so 4:2:0 will be generated at the same
time.
update: now it processes overlapping tiles (18x18) to avoid problems on the MCU boarders

Y= 0.299*R+0.587*G+0.114*B
Cb=-0.168*R-0.3313*G+0.5*B = 0.564*(B-Y)+128
Cr=0.5*R-0.4187*G-0.0813*B = 0.713*(R-Y)+128

For Bayer array (GR/BG)(bayer_phase[1:0]==0), and pixels P[Y,X]:

R[0,0]=0.5* (P[0,-1]+P[0,1])
R[0,1]=      P[0,1]
R[1,0]=0.25*(P[0,-1]+P[0,1]+P[2,-1]+P[2,1])
R[1,1]=0.5 *(P[0,1] +P[2,1])

G[0,0]=      P[0,0]
G[0,1]=0.25*(P[-1,1]+P[0,0]+P[0,2]+P[1,1])
G[1,0]=0.25*(P[0,0]+P[1,-1]+P[1,1]+P[2,0])
G[1,1]=      P[1,1]

B[0,0]=0.5* (P[-1,0]+P[1,0])
B[0,1]=0.25*(P[-1,0]+P[-1,2]+P[1,0]+P[1,2])
B[1,0]=      P[1,0]
B[1,1]=0.5* (P[1,0]+P[1,2])

Y[0,0]=0.299*0.5*(P[0,-1]+P[0,1]) + 0.587*P[0,0] + 0.114*0.5* (P[-1,0]+P[1,0])
Y[0,1]=0.299*P[0,1]+0.587*0.25*(P[-1,1]+P[0,0]+P[0,2]+P[1,1])+0.114*0.25*(P[-1,0]+P[-1,2]+P[1,0]+P[1,2])
Y[1,0]=0.299*0.25*(P[0,-1]+P[0,1]+P[2,-1]+P[2,1])+0.587*0.25*(P[0,0]+P[1,-1]+P[1,1]+P[2,0])+0.114*P[1,0]
Y[1,1]=0.299*0.5 *(P[0,1] +P[2,1])+0.587*P[1,1]+0.114*0.5* (P[1,0]+P[1,2])

Y[0,0]=(0x96*P[0,0]+   0x4d*((P[0,-1]+P[0,1])/2) +               0x1d*((P[-1,0]+P[1,0])/2))>>8
Y[0,1]=(0x4d*P[0,1]+   0x96*((P[-1,1]+P[0,0]+P[0,2]+P[1,1])/4)+  0x1d*((P[-1,0]+P[-1,2]+P[1,0]+P[1,2])/4))>>8
Y[1,0]=(0x1d*P[1,0]+   0x96*((P[0,0]+P[1,-1]+P[1,1]+P[2,0])/4)+  0x4d*((P[0,-1]+P[0,1]+P[2,-1]+P[2,1])/4))>>8
Y[1,1]=(0x96*P[1,1]+   0x1d*((P[1,0]+P[1,2])/2) +                0x4d*((P[0,1] +P[2,1])/2)))>>8

Cb and Cy are needed 1 for each 4 pixels (4:2:0)
(YC= 0.299*P[0,1]+0.587*(0.5*P[0,0]+P[1,1])+0.114*P[1,0] )
Cb=0.564*(P[1,0]-(0.299*P[0,1]+0.587*0.5*(P[0,0]+P[1,1])+0.114*P[1,0]))+128
Cr=0.713*(P[0,1]-(0.299*P[0,1]+0.587*0.5*(P[0,0]+P[1,1])+0.114*P[1,0]))+128

Cb=0.564*(P[1,0]-(0.299*P[0,1]+0.587*0.5*(P[0,0]+P[1,1])+0.114*P[1,0]))+128=
   0.564*P[1,0]-0.299*0.564*P[0,1]-0.587*0.564*0.5*(P[0,0]+P[1,1])-0.114*0.564*P[1,0]))+128=
   0.564*P[1,0]-0.168636*P[0,1]-0.165534*P[0,0]-0.165534*P[1,1]-0.064638*P[1,0]+128=
   0.499362*P[1,0]-0.168636*P[0,1]-0.165534*P[0,0]-0.165534*P[1,1]+128=
	-0.165534*P[0,0] -0.168636*P[0,1] +0.499362*P[1,0] -0.165534*P[1,1]+ 128=
	(-256*0.165534*P[0,0] -256*0.168636*P[0,1] +256*0.499362*P[1,0] -256*0.165534*P[1,1])>>8+ 128=
	(-42.5*P[0,0] -43*P[0,1] +128*P[1,0] -42.5*P[1,1])>>8+ 128=
	(-85*((P[0,0]+P[1,1])/2) -43*P[0,1] +128*P[1,0])>>8+ 128=
	(-0x55*((P[0,0]+P[1,1])/2) -2b*P[0,1] +P[1,0]<<7)>>8+ 0x80=
	(-0x55*((P[0,0]+P[1,1])/2) -2b*P[0,1])>>8  +P[1,0]>>1 +0x80=

Cr=0.713*(P[0,1]-(0.299*P[0,1]+0.587*0.5*(P[0,0]+P[1,1])+0.114*P[1,0]))+128=
   0.713* P[0,1]- 0.713*0.299*P[0,1] - 0.713*0.587*0.5*P[0,0]- 0.713*0.587*0.5*P[1,1] -0.713*0.114*P[1,0]+128=
   0.713* P[0,1]- 0.213187*P[0,1] - 0.2092655*P[0,0]- 0.2092655*P[1,1] -0.081282*P[1,0]+128=
   0.499813* P[0,1] -0.2092655*P[0,0] -0.2092655*P[1,1] -0.081282*P[1,0]+128=
   -0.2092655*P[0,0] +0.499813* P[0,1] -0.081282*P[1,0] -0.2092655*P[1,1] +128=
   (-256*0.2092655*P[0,0] +256*0.499813* P[0,1] -256*0.081282*P[1,0] -256*0.2092655*P[1,1])>>8 +128=
   (-54*P[0,0] +128* P[0,1] -21*P[1,0] -54*P[1,1])>>8 +128=	// rounded up, sum=129 -> decreasing
   (-53.5*P[0,0] +128* P[0,1] -21*P[1,0] -53.5*P[1,1])>>8 +128=
   (-107*((P[0,0]+P[1,1])/2) +P[0,1]<<7 -21*P[1,0])>>8 +128=
   (-0x6b*((P[0,0]+P[1,1])/2) +P[0,1]<<7 -0x15*P[1,0])>>8 +0x80=
   (-0x6b*((P[0,0]+P[1,1])/2) -0x15*P[1,0])>>8 +P[0,1]>>1 +0x80=

*/ /*
For Bayer array (RG/GB)(bayer_phase[1:0]==1), and pixels P[Y,X]:

R[0,0]=      P[0,0]
R[0,1]=0.5 *(P[0,0]+P[0,2])
R[1,0]=0.5 *(P[0,0]+P[2,0])
R[1,1]=0.25*(P[0,0]+P[0,2]+P[2,0]+P[2,2])

G[0,0]=0.25*(P[-1,0]+P[0,-1]+P[0,1]+P[1,0])
G[0,1]=      P[0,1]
G[1,0]=      P[1,0]
G[1,1]=0.25*(P[0,1]+P[1,0]+P[1,2]+P[2,1])

B[0,0]=0.25*(P[-1,-1]+P[-1,1]+P[1,-1]+P[1,1])
B[0,1]=0.5* (P[-1,1]+P[1,1])
B[1,0]=0.5* (P[1,-1]+P[1,1])
B[1,1]=      P[1,1]

Y[0,0]=0.299*P[0,0] + 0.587*0.25*(P[-1,0]+P[0,-1]+P[0,1]+P[1,0]) + 0.114*0.25*(P[-1,-1]+P[-1,1]+P[1,-1]+P[1,1])
Y[0,1]=0.299*0.5 *(P[0,0]+P[0,2])+0.587*P[0,1]+0.114*0.5* (P[-1,1]+P[1,1])
Y[1,0]=0.299*0.5 *(P[0,0]+P[2,0])+0.587*P[1,0]+0.114*0.5* (P[1,-1]+P[1,1])
Y[1,1]=0.299*0.25*(P[0,0]+P[0,2]+P[2,0]+P[2,2])+0.587*0.25*(P[0,1]+P[1,0]+P[1,2]+P[2,1])+0.114*P[1,1]

Y[0,0]=(0x4d*P[0,0]+   0x96*((P[-1,0]+P[0,-1]+P[0,1]+P[1,0])/4) + 0x1d*((P[-1,-1]+P[-1,1]+P[1,-1]+P[1,1])/4))>>8
Y[0,1]=(0x96*P[0,1]+   0x4d*((P[0,0]+P[0,2])/2)+                  0x1d*((P[-1,1]+P[1,1])/2))>>8
Y[1,0]=(0x96*P[1,0]+   0x4d*((P[0,0]+P[2,0])/2)+                  0x1d*((P[1,-1]+P[1,1])/2))>>8
Y[1,1]=(0x1d*P[1,1]+   0x96*((P[0,1]+P[1,0]+P[1,2]+P[2,1])/4) +   0x4d*((P[0,0]+P[0,2]+P[2,0]+P[2,2])/4)))>>8

Cb and Cy are needed 1 for each 4 pixels (4:2:0)
(YC= 0.299*P[0,0]+0.587*(0.5*P[0,1]+P[1,0])+0.114*P[1,1] )
Cb=0.564*(P[1,1]-(0.299*P[0,0]+0.587*0.5*(P[0,1]+P[1,0])+0.114*P[1,1]))+128
Cr=0.713*(P[0,0]-(0.299*P[0,0]+0.587*0.5*(P[0,1]+P[1,0])+0.114*P[1,1]))+128

Cb=0.564*(P[1,1]-(0.299*P[0,0]+0.587*0.5*(P[0,1]+P[1,0])+0.114*P[1,1]))+128=
	(-0x55*((P[0,1]+P[1,0])/2) -2b*P[0,0] +P[1,1]<<7)>>8+ 0x80=
	(-0x55*((P[0,1]+P[1,0])/2) -2b*P[0,0])>>8  +P[1,1]>>1 +0x80=

Cr=0.713*(P[0,0]-(0.299*P[0,0]+0.587*0.5*(P[0,1]+P[1,0])+0.114*P[1,1]))+128=
   (-0x6b*((P[0,1]+P[1,0])/2) +P[0,0]<<7 -0x15*P[1,1])>>8 +0x80=
   (-0x6b*((P[0,1]+P[1,0])/2) -0x15*P[1,1])>>8 +P[0,0]>>1 +0x80=
----
*/ /*
For Bayer array (BG/GR)(bayer_phase[1:0]==2), and pixels P[Y,X]:

R[0,0]=0.25*(P[-1,-1]+P[-1,1]+P[1,-1]+P[1,1])
R[0,1]=0.5 *(P[-1,1] +P[1,1])
R[1,0]=0.5* (P[1,-1]+P[1,1])
R[1,1]=      P[1,1]

G[0,0]=0.25*(P[-1,0]+P[0,-1]+P[0,1]+P[1,0])
G[0,1]=      P[0,1]
G[1,0]=      P[1,0]
G[1,1]=0.25*(P[0,1]+P[1,0]+P[1,2]+P[2,1])

B[0,0]=      P[0,0]
B[0,1]=0.5* (P[0,0]+P[0,2])
B[1,0]=0.5* (P[0,0]+P[2,0])
B[1,1]=0.25*(P[0,0]+P[0,2]+P[2,0]+P[2,2])

Y[0,0]=0.299*0.25*(P[-1,-1]+P[-1,1]+P[1,-1]+P[1,1]) + 0.587*0.25*(P[-1,0]+P[0,-1]+P[0,1]+P[1,0]) + 0.114* P[0,0]
Y[0,1]=0.299*0.5 *(P[-1,1] +P[1,1])+0.587*P[0,1]+0.114*0.5* (P[0,0]+P[0,2])
Y[1,0]=0.299*0.5* (P[1,-1]+P[1,1])+0.587*P[1,0]+0.114*0.5* (P[0,0]+P[2,0])
Y[1,1]=0.299*P[1,1]+0.587*0.25*(P[0,1]+P[1,0]+P[1,2]+P[2,1])+0.114*0.25*(P[0,0]+P[0,2]+P[2,0]+P[2,2])

Y[0,0]=(0x1d*P[0,0]+   0x96*((P[-1,0]+P[0,-1]+P[0,1]+P[1,0])/4)+ 0x4d*((P[-1,-1]+P[-1,1]+P[1,-1]+P[1,1])/4))>>8
Y[0,1]=(0x96*P[0,1]+   0x4d*((P[-1,1] +P[1,1])/2)+               0x1d*((P[0,0]+P[0,2])/2))>>8
Y[1,0]=(0x96*P[1,0]+   0x4d*((P[1,-1]+P[1,1])/2)+                0x1d*((P[0,0]+P[2,0])/2))>>8
Y[1,1]=(0x4d*P[1,1]+   0x96*((P[0,1]+P[1,0]+P[1,2]+P[2,1])/4) +  0x1d*((P[0,0]+P[0,2]+P[2,0]+P[2,2])/4)))>>8

Cb and Cy are needed 1 for each 4 pixels (4:2:0)
(YC= 0.299*P[1,1]+0.587*(0.5*P[1,0]+P[0,1])+0.114*P[0,0] )
Cb=0.564*(P[0,0]-(0.299*P[1,1]+0.587*0.5*(P[1,0]+P[0,1])+0.114*P[0,0]))+128
Cr=0.713*(P[1,1]-(0.299*P[1,1]+0.587*0.5*(P[1,0]+P[0,1])+0.114*P[0,0]))+128

Cb=0.564*(P[0,0]-(0.299*P[1,1]+0.587*0.5*(P[1,0]+P[0,1])+0.114*P[0,0]))+128=
	(-0x55*((P[1,0]+P[0,1])/2) -2b*P[1,1] +P[0,0]<<7)>>8+ 0x80=
	(-0x55*((P[1,0]+P[0,1])/2) -2b*P[1,1])>>8  +P[0,0]>>1 +0x80=

Cr=0.713*(P[1,1]-(0.299*P[1,1]+0.587*0.5*(P[1,0]+P[0,1])+0.114*P[0,0]))+128=
   (-0x6b*((P[1,0]+P[0,1])/2) +P[1,1]<<7 -0x15*P[0,0])>>8 +0x80=
   (-0x6b*((P[1,0]+P[0,1])/2) -0x15*P[0,0])>>8 +P[1,1]>>1 +0x80=
----
*/ /*
For Bayer array (GB/RG)(bayer_phase[1:0]==3), and pixels P[Y,X]:

R[0,0]=0.5 *(P[-1,0]+P[1,0])
R[0,1]=0.25*(P[-1,0]+P[-1,2]+P[1,0]+P[1,2])
R[1,0]=      P[1,0]
R[1,1]=0.5 *(P[1,0]+P[1,2])

G[0,0]=      P[0,0]
G[0,1]=0.25*(P[-1,1]+P[0,0]+P[0,2]+P[1,1])
G[1,0]=0.25*(P[0,0]+P[1,-1]+P[1,1]+P[2,0])
G[1,1]=      P[1,1]

B[0,0]=0.5* (P[0,-1]+P[0,1])
B[0,1]=      P[0,1]
B[1,0]=0.25*(P[0,-1]+P[0,1]+P[2,-1]+P[2,1])
B[1,1]=0.5* (P[0,1]+P[2,1])

Y[0,0]=0.299*0.5 *(P[-1,0]+P[1,0]) + 0.587*P[0,0] + 0.114*0.5* (P[0,-1]+P[0,1])
Y[0,1]=0.299*0.25*(P[-1,0]+P[-1,2]+P[1,0]+P[1,2])+0.587*0.25*(P[-1,1]+P[0,0]+P[0,2]+P[1,1])+0.114*P[0,1]
Y[1,0]=0.299*P[1,0]+0.587*0.25*(P[0,-1]+P[0,1]+P[2,-1]+P[2,1])+0.114*0.25*(P[0,-1]+P[0,1]+P[2,-1]+P[2,1])
Y[1,1]=0.299*0.5 *(P[1,0]+P[1,2])+0.587*P[1,1]+0.114*0.5* (P[0,1]+P[2,1])

Y[0,0]=(0x96*P[0,0]+   0x4d*((P[-1,0]+P[1,0])/2) +               0x1d*((P[0,-1]+P[0,1])/2))>>8
Y[0,1]=(0x1d*P[0,1]+   0x96*((P[-1,1]+P[0,0]+P[0,2]+P[1,1])/4)+  0x4d*((P[-1,0]+P[-1,2]+P[1,0]+P[1,2])/4))>>8
Y[1,0]=(0x4d*P[1,0]+   0x96*((P[0,0]+P[1,-1]+P[1,1]+P[2,0])/4)+  0x1d*((P[0,-1]+P[0,1]+P[2,-1]+P[2,1])/4))>>8
Y[1,1]=(0x96*P[1,1]+   0x4d*((P[1,0]+P[1,2])/2 +                 0x1d*((P[0,1] +P[2,1])/2)))>>8

Cb and Cy are needed 1 for each 4 pixels (4:2:0)
(YC= 0.299*P[1,0]+0.587*(0.5*P[1,1]+P[0,0])+0.114*P[0,1] )
Cb=0.564*(P[0,1]-(0.299*P[1,0]+0.587*0.5*(P[1,1]+P[0,0])+0.114*P[0,1]))+128
Cr=0.713*(P[1,0]-(0.299*P[1,0]+0.587*0.5*(P[1,1]+P[0,0])+0.114*P[0,1]))+128

Cb=0.564*(P[0,1]-(0.299*P[1,0]+0.587*0.5*(P[1,1]+P[0,0])+0.114*P[0,1]))+128=
	(-0x55*((P[1,1]+P[0,0])/2) -2b*P[1,0] +P[0,1]<<7)>>8+ 0x80=
	(-0x55*((P[1,1]+P[0,0])/2) -2b*P[1,0])>>8  +P[0,1]>>1 +0x80=

Cr=0.713*(P[1,0]-(0.299*P[1,0]+0.587*0.5*(P[1,1]+P[0,0])+0.114*P[0,1]))+128=
   (-0x6b*((P[1,1]+P[0,0])/2) +P[1,0]<<7 -0x15*P[0,1])>>8 +0x80=
   (-0x6b*((P[1,1]+P[0,0])/2) -0x15*P[0,1])>>8 +P[1,0]>>1 +0x80=
----
*/
/* 02/24/2003 - modified to include bypass for monochrome mode*/
/* 06/29/2004 - added counting of pixels with value of 0 and 255 (limited to 255 to use just 8 bits) */
//05.07.2008 - latency included here
module csconvert18a(
                 input         RST,
                 input         CLK,
                 input	       mono,
                 input         limit_diff,   // 1 - limit color outputs to -128/+127 range, 0 - let them be limited downstream
                 input  [ 9:0] m_cb,         // [9:0] scale for CB - default 0.564 (10'h90)
                 input  [ 9:0] m_cr,         // [9:0] scale for CB - default 0.713 (10'hb6)
                 input  [ 7:0] din,          // input bayer data in scanline sequence, GR/BG sequence
                 input         pre_first_in, // marks the first input pixel
                 output [ 7:0] signed_y,     //  - now signed char, -128(black) to +127 (white)
                 output [ 8:0] q,            // new, q is just signed char
                 output [ 7:0] yaddr,        // address for the external buffer memory to write 16x16x8bit Y data
                 output        ywe,          // wrire enable of Y data
                 output [ 6:0] caddr,        // address for the external buffer memory 2x8x8x8bit Cb+Cr data (MSB=0 - Cb, 1 - Cr)
                 output        cwe,          // write enable for CbCr data
                 output        pre_first_out,
                 input  [ 1:0] bayer_phase,
                 output [ 7:0] n000,
                 output [ 7:0] n255);

// Was: s ynthesis attribute shreg_extract of csconvert18a is yes;"

  wire        ystrt,nxtline;
  reg	[7:0] yaddr_r; // address for the external buffer memory to write 16x16x8bit Y data
  reg         ywe_r;	 // write enable of Y data
  reg   [6:0] caddr_r; // address for the external buffer memory 2x8x8x8bit Cb+Cr data (MSB=0 - Cb, 1 - Cr)
  reg         cwe_r;	 // write enable for CbCr data 
  reg         odd_pix;  // odd pixel (assumes even number of pixels in a line
  reg         odd_line; // odd line
  reg         pix_green;// (was "odd_pix==odd_line", now modified with bayer_phase[1:0]: bayer_phase[1]^bayer_phase[0]^(odd_pix==odd_line)
  reg         y_eq_0, y_eq_255;
  reg   [7:0] n000_r;
  reg   [7:0] n255_r;
  wire  [1:0] strt_dly;
  wire        strt;
  reg   [7:0] signed_y_r;
  
  assign pre_first_out=ystrt;

  assign n000 =     n000_r;
  assign n255 =     n255_r;
  assign signed_y = signed_y_r;     //  - now signed char, -128(black) to +127 (white)
  assign yaddr =    yaddr_r2;
  assign ywe =      ywe_r2;
  assign caddr =    caddr_r2;
  assign cwe =      cwe_r2;
  
    dly_16 #(.WIDTH(1)) i_strt_dly0 (.clk(CLK),.rst(1'b0), .dly(4'd15), .din(pre_first_in), .dout(strt_dly[0]));
    dly_16 #(.WIDTH(1)) i_strt_dly1 (.clk(CLK),.rst(1'b0), .dly(4'd15), .din(strt_dly[0]),  .dout(strt_dly[1]));
    dly_16 #(.WIDTH(1)) i_strt      (.clk(CLK),.rst(1'b0), .dly( 4'd4), .din(strt_dly[1]),  .dout(strt));
  
//  SRL16 i_strt_dly0  (.Q(strt_dly[0]),  .D(pre_first_in),                                  .CLK(CLK),   .A0(1'b1),  .A1(1'b1), .A2(1'b1), .A3(1'b1)); // dly=15+1
//  SRL16 i_strt_dly1  (.Q(strt_dly[1]),  .D(strt_dly[0]),                                   .CLK(CLK),   .A0(1'b1),  .A1(1'b1), .A2(1'b1), .A3(1'b1)); // dly=15+1
//  SRL16 i_strt       (.Q(strt),         .D(strt_dly[1]),                                   .CLK(CLK),   .A0(1'b0),  .A1(1'b0), .A2(1'b1), .A3(1'b0)); // dly=4+1
    dly_16 #(.WIDTH(1)) i_ystrt   (.clk(CLK),.rst(1'b0), .dly(4'd5), .din(strt), .dout(ystrt));
    dly_16 #(.WIDTH(1)) i_nxtline (.clk(CLK),.rst(1'b0), .dly(4'd1), .din(!RST && ywe_r && (yaddr_r[3:0]==4'hf) && (yaddr_r[7:4]!=4'hf)), .dout(nxtline));

//  SRL16 i_ystrt  (.Q(ystrt),  .D(strt),                                                    .CLK(CLK),   .A0(1'b1),  .A1(1'b0), .A2(1'b1), .A3(1'b0));	// dly=5+1
//  SRL16 i_nxtline(.Q(nxtline),.D(!RST && ywe_r && (yaddr_r[3:0]==4'hf) && (yaddr_r[7:4]!=4'hf)), .CLK(CLK),   .A0(1'b1),  .A1(1'b0), .A2(1'b0), .A3(1'b0));	// dly=1+1

  always @ (posedge CLK) begin
      ywe_r <= !RST && (ystrt || nxtline || (ywe_r && (yaddr_r[3:0]!=4'hf)));
	  yaddr_r[7:4] <= (RST || strt)? 4'h0: (nxtline?(yaddr_r[7:4]+1):yaddr_r[7:4]);
	  yaddr_r[3:0] <= ywe_r? (yaddr_r[3:0]+1):4'h0;
	  odd_pix <= RST || strt || ~odd_pix;
	  if (RST || strt)           odd_line <= 1'b0;
	  else if (yaddr_r[3:0]==4'hd) odd_line <= ~odd_line;
	  if (RST || strt)           pix_green <=bayer_phase[1]^bayer_phase[0];
	  else                       pix_green <=~(yaddr_r[3:0]==4'hd)^pix_green;
  end

// First block generates 2 8-bit values (latency=3)- pixel (p2) and average value of previous and next pixel in the same
// row (pa). For the first pixel that "average" equals to next pixel, for the last - previous
  reg		[7:0] p0;
  reg		[7:0] p1;
  reg		[7:0] pd0;
  reg		[7:0]	pa0;
  wire   [8:0] ppa;
  always @ (posedge CLK) p0  <= din[7:0];
  always @ (posedge CLK) p1  <= p0[7:0];
//  always @ (posedge CLK) pd0 <= p1[7:0];
  always @ (posedge RST or posedge CLK) if (RST) pd0 <= 8'b0; else pd0 <= p1[7:0]; // generates more effective than with 2-bit SRs (line above)
  assign	ppa[8:0]={1'b0,pd0}+{1'b0,p0};
  always @ (posedge CLK) pa0 <=ppa[8:1];  //loosing 1 bit here!
// next - 2 pairs of 8 bit wide 16-bit long serial-in, serial out shift registers. Verify implementation - Should use 32 LUTs
// update 06/10/2004 - make an output pd_c[7:0] 2 cycles after pd_1[7:0] for color processing without additional resources
  reg [17:0] pd_10,pd_11,pd_12,pd_13,pd_14,pd_15,pd_16,pd_17;
//  reg [17:0] pd_20,pd_21,pd_22,pd_23,pd_24,pd_25,pd_26,pd_27;
  reg  [7:0] pd1_dly;
  reg  [7:0] pdc;
  reg [15:0] pd_20,pd_21,pd_22,pd_23,pd_24,pd_25,pd_26,pd_27;
  reg [17:0] pa_10,pa_11,pa_12,pa_13,pa_14,pa_15,pa_16,pa_17;
  reg [17:0] pa_20,pa_21,pa_22,pa_23,pa_24,pa_25,pa_26,pa_27;

  wire [7:0] pd1;
  wire [7:0] pd2;
  wire [7:0] pa1;
  wire [7:0] pa2;

   assign pd1={pd_17[17],pd_16[17],pd_15[17],pd_14[17],pd_13[17],pd_12[17],pd_11[17],pd_10[17]};
   assign pd2={pd_27[15],pd_26[15],pd_25[15],pd_24[15],pd_23[15],pd_22[15],pd_21[15],pd_20[15]};
   assign pa1={pa_17[17],pa_16[17],pa_15[17],pa_14[17],pa_13[17],pa_12[17],pa_11[17],pa_10[17]};
   assign pa2={pa_27[17],pa_26[17],pa_25[17],pa_24[17],pa_23[17],pa_22[17],pa_21[17],pa_20[17]};


  always @ (posedge CLK) pd_10 <= {pd_10[16:0],pd0[0]};
  always @ (posedge CLK) pd_11 <= {pd_11[16:0],pd0[1]};
  always @ (posedge CLK) pd_12 <= {pd_12[16:0],pd0[2]};
  always @ (posedge CLK) pd_13 <= {pd_13[16:0],pd0[3]};
  always @ (posedge CLK) pd_14 <= {pd_14[16:0],pd0[4]};
  always @ (posedge CLK) pd_15 <= {pd_15[16:0],pd0[5]};
  always @ (posedge CLK) pd_16 <= {pd_16[16:0],pd0[6]};
  always @ (posedge CLK) pd_17 <= {pd_17[16:0],pd0[7]};

  always @ (posedge CLK) pd1_dly[7:0] <= pd1[7:0];
  always @ (posedge CLK) pdc[7:0]     <= pd1_dly[7:0];
  always @ (posedge CLK) pd_20 <= {pd_20[14:0],pdc[0]};
  always @ (posedge CLK) pd_21 <= {pd_21[14:0],pdc[1]};
  always @ (posedge CLK) pd_22 <= {pd_22[14:0],pdc[2]};
  always @ (posedge CLK) pd_23 <= {pd_23[14:0],pdc[3]};
  always @ (posedge CLK) pd_24 <= {pd_24[14:0],pdc[4]};
  always @ (posedge CLK) pd_25 <= {pd_25[14:0],pdc[5]};
  always @ (posedge CLK) pd_26 <= {pd_26[14:0],pdc[6]};
  always @ (posedge CLK) pd_27 <= {pd_27[14:0],pdc[7]};

  always @ (posedge CLK) pa_10 <= {pa_10[16:0],pa0[0]};
  always @ (posedge CLK) pa_11 <= {pa_11[16:0],pa0[1]};
  always @ (posedge CLK) pa_12 <= {pa_12[16:0],pa0[2]};
  always @ (posedge CLK) pa_13 <= {pa_13[16:0],pa0[3]};
  always @ (posedge CLK) pa_14 <= {pa_14[16:0],pa0[4]};
  always @ (posedge CLK) pa_15 <= {pa_15[16:0],pa0[5]};
  always @ (posedge CLK) pa_16 <= {pa_16[16:0],pa0[6]};
  always @ (posedge CLK) pa_17 <= {pa_17[16:0],pa0[7]};

  always @ (posedge CLK) pa_20 <= {pa_20[16:0],pa_10[17]};
  always @ (posedge CLK) pa_21 <= {pa_21[16:0],pa_11[17]};
  always @ (posedge CLK) pa_22 <= {pa_22[16:0],pa_12[17]};
  always @ (posedge CLK) pa_23 <= {pa_23[16:0],pa_13[17]};
  always @ (posedge CLK) pa_24 <= {pa_24[16:0],pa_14[17]};
  always @ (posedge CLK) pa_25 <= {pa_25[16:0],pa_15[17]};
  always @ (posedge CLK) pa_26 <= {pa_26[16:0],pa_16[17]};
  always @ (posedge CLK) pa_27 <= {pa_27[16:0],pa_17[17]};
  
  
  wire [7:0] pd_prev= pd2[7:0];
  wire [7:0] pd_next= pd0[7:0];
  wire [7:0] pa_prev= pa2[7:0];
  wire [7:0] pa_next= pa0[7:0];

// now the result Y calculation depends on the pixel position (bx,by). It consists of 3 terms, each with different coefficient.
// first term always includes pd1[7:0]
// if (bx[1]==by[1]) // 00 or 11
// second term is pa1, third - (pd0+pd2)/2
// else
// second term is (pa1 + (pd0+pd2)/2)/2, third - (pa0+pa2)/2
//  reg		[7:0] m1; same as pd1_dly
  reg		[7:0] m2;
  reg		[7:0] m3;
  wire	[8:0]	pd02s=   {1'b0,pd_prev[7:0]}+{1'b0,pd_next[7:0]};   // will use pd02s[8:1]
  wire	[8:0]	pa1pd02s={1'b0,pa1[7:0]}+{1'b0,pd02s[8:1]}; // will use pa1pd02s[8:1]
  wire	[8:0]	pa02s=   {1'b0,pa_prev[7:0]}+{1'b0,pa_next[7:0]};   // will use pa02s[8:1]
//  always @ (posedge CLK) m1 <= pd1[7:0]; // same as pd1_dly
//  always @ (posedge CLK) m2 <= (odd_pix==odd_line)? pa1[7:0]   : pa1pd02s[8:1];
//  always @ (posedge CLK) m3 <= (odd_pix==odd_line)? pd02s[8:1] : pa02s[8:1];
  always @ (posedge CLK) m2 <= pix_green? pa1[7:0]   : pa1pd02s[8:1];
  always @ (posedge CLK) m3 <= pix_green? pd02s[8:1] : pa02s[8:1];
/*
Y[0,0]=(0x96*P[0,0]+   0x4d*((P[0,-1]+P[0,1])/2) +               0x1d*((P[-1,0]+P[1,0])/2))>>8
Y[0,1]=(0x4d*P[0,1]+   0x96*((P[-1,1]+P[0,0]+P[0,2]+P[1,1])/4)+  0x1d*((P[-1,0]+P[-1,2]+P[1,0]+P[1,2])/4))>>8
Y[1,0]=(0x1d*P[1,0]+   0x96*((P[0,0]+P[1,-1]+P[1,1]+P[2,0])/4)+  0x4d*((P[0,-1]+P[0,1]+P[2,-1]+P[2,1])/4))>>8
Y[1,1]=(0x96*P[1,1]+   0x1d*((P[1,0]+P[1,2])/2 +                 0x4d*((P[0,1] +P[2,1])/2)))>>8
+-----+--------+-------+-------+-------+-------+-------+
|     |  (0)   |       |       |   *   |   *   | *   * |
|     |  G R   |   *   | * + * |   +   | * + * |   +   |
|     |  B G   |       |       |   *   |   *   | *   * |
+-----+--------+-------+-------+-------+-------+-------+
|  0  | P[0,0] |  0x96 |  0x4d |  0x1d |       |       |
|     +--------+-------+-------+-------+-------+-------+
| G R | P[0,1] |  0x4d |       |       |  0x96 |  0x1d |
|     +--------+-------+-------+-------+-------+-------+
| B G | P[1,0] |  0x1d |       |       |  0x96 |  0x4d |
|     +--------+-------+-------+-------+-------+-------+
|     | P[1,1] |  0x96 |  0x1d |  0x4d |       |       |
+-----+--------+-------+-------+-------+-------+-------+
|  1  | P[0,0] |  0x4d |       |       |  0x96 |  0x1d |
|     +--------+-------+-------+-------+-------+-------+
| R G | P[0,1] |  0x96 |  0x4d |  0x1d |       |       |
|     +--------+-------+-------+-------+-------+-------+
| G B | P[1,0] |  0x96 |  0x1d |  0x4d |       |       |
|     +--------+-------+-------+-------+-------+-------+
|     | P[1,1] |  0x1d |       |       |  0x96 |  0x4d |
+-----+--------+-------+-------+-------+-------+-------+
|  2  | P[0,0] |  0x1d |       |       |  0x96 |  0x4d |
|     +--------+-------+-------+-------+-------+-------+
| B G | P[0,1] |  0x96 |  0x1d |  0x4d |       |       |
|     +--------+-------+-------+-------+-------+-------+
| G R | P[1,0] |  0x96 |  0x4d |  0x1d |       |       |
|     +--------+-------+-------+-------+-------+-------+
|     | P[1,1] |  0x4d |       |       |  0x96 |  0x1d |
+-----+--------+-------+-------+-------+-------+-------+
|  3  | P[0,0] |  0x96 |  0x1d |  0x4d |       |       |
|     +--------+-------+-------+-------+-------+-------+
| G B | P[0,1] |  0x1d |       |       |  0x96 |  0x4d |
|     +--------+-------+-------+-------+-------+-------+
| R G | P[1,0] |  0x4d |       |       |  0x96 |  0x1d |
|     +--------+-------+-------+-------+-------+-------+
|     | P[1,1] |  0x96 |  0x4d |  0x1d |       |       |
+-----+--------+-------+-------+-------+-------+-------+


*/
  reg [7:0] k1;
  reg [7:0] k2;
  reg [7:0] k3;
  always @ (posedge CLK) case ({bayer_phase[1:0],odd_line,odd_pix})
// 0 - GR/BG
    4'b0000: begin
               k1<=8'h96;
               k2<=8'h4d;
               k3<=8'h1d;
             end
    4'b0001: begin
               k1<=8'h4d;
               k2<=8'h96;
               k3<=8'h1d;
             end
    4'b0010: begin
               k1<=8'h1d;
               k2<=8'h96;
               k3<=8'h4d;
             end
    4'b0011: begin
               k1<=8'h96;
               k2<=8'h1d;
               k3<=8'h4d;
             end
// 1 - RG/GB
    4'b0100: begin
               k1<=8'h4d;
               k2<=8'h96;
               k3<=8'h1d;
             end
    4'b0101: begin
               k1<=8'h96;
               k2<=8'h4d;
               k3<=8'h1d;
             end
    4'b0110: begin
               k1<=8'h96;
               k2<=8'h1d;
               k3<=8'h4d;
             end
    4'b0111: begin
               k1<=8'h1d;
               k2<=8'h96;
               k3<=8'h4d;
             end
// 2 - BG/GR
    4'b1000: begin
               k1<=8'h1d;
               k2<=8'h96;
               k3<=8'h4d;
             end
    4'b1001: begin
               k1<=8'h96;
               k2<=8'h1d;
               k3<=8'h4d;
             end
    4'b1010: begin
               k1<=8'h96;
               k2<=8'h4d;
               k3<=8'h1d;
             end
    4'b1011: begin
               k1<=8'h4d;
               k2<=8'h96;
               k3<=8'h1d;
             end
// 3 - GB/RG
    4'b1100: begin
               k1<=8'h96;
               k2<=8'h1d;
               k3<=8'h4d;
             end
    4'b1101: begin
               k1<=8'h1d;
               k2<=8'h96;
               k3<=8'h4d;
             end
    4'b1110: begin
               k1<=8'h4d;
               k2<=8'h96;
               k3<=8'h1d;
             end
    4'b1111: begin
               k1<=8'h96;
               k2<=8'h4d;
               k3<=8'h1d;
             end
  endcase

  wire [15:0] mm1=pd1_dly[7:0] * k1[7:0]; //m1[7:0]*k1[7:0];
  wire [15:0] mm2=m2[7:0]*k2[7:0];
  wire [15:0] mm3=m3[7:0]*k3[7:0];

  reg   [7:0] y;
//  reg   [7:0] y0;	// bypass in monochrome mode
//  wire  [7:0] y0 = pdc;
  reg  [7:0] y0_r;
//  wire   [7:0] y0;	// bypass in monochrome mode
  reg   [15:0] y1,y2,y3;
  
// TODO: insert register to ease mm1..3 -> y (OK to delay all outputs).
// TODO: reduce width of y1,y2,y3 and correctly round   
//  wire	[15:0] y_sum =y1+y2+y3;
  reg   [15:0] y_sum_r;
//  always @ (posedge CLK) y0 <= pd1_dly; // m1; // equivalent
//  wire   [7:0] pre_y= mono ? y0 : (y_sum[15:8]+y_sum[7]);
  wire   [7:0] pre_y= mono ? y0_r : (y_sum_r[15:8]+y_sum_r[7]);
// making y output signed -128..+127

  always @ (posedge CLK) begin
      y1 <= mm1;
      y2 <= mm2;
      y3 <= mm3;
      y0_r <= pdc;
      y_sum_r <= y1+y2+y3;
      y[7:0] <= pre_y[7:0];
      signed_y_r[7:0] <= {~pre_y[7], pre_y[6:0]};
  end


// Try easier and hope better algorithm of color extractions that should perform better on gradients.
// It will rely on the fact that Y is already calculated, so instead of processing 4 pixels it will
// calculate Cb for "B" pixel, and Cr - for "R", subtracting calculated "Y" for that pixel.
//Cb = 0.564*(B-Y)+128
//Cr = 0.713*(R-Y)+128
// First - delay pd1[7:0] by 2 clock periods - to match "Y" output (one ahead, actually)
// It is better to implement it earlier - while calculating pd2 - anyway it had to be delayed by 18 (16+2) form pd1 - make it in 2 stages 2 +16
// pdc[7:0] - one cycle ahead of the "Y" for each pixel
// Try multiplication by constant without the register for that constant, just 2:1 mux. Still use aregister for the other operand (is it needed?)
reg   [7:0] cbcrmult1;
//wire  [7:0] cbcrmult2; // 1 of 2 constants - should be valid during ywe_r and 1 more cycle ("use_cr"
wire  [9:0] cbcrmult2; // 1 of 2 constants - should be valid during ywe_r and 1 more cycle ("use_cr"
//wire [15:0] cbcrmulto; // output of 8x8 multiplier
wire [17:0] cbcrmulto; // output of 8x8 multiplier

// ignoring overflow we do not need extra bits
// high saturation can cause overflow, but we have very limited resources in model 313 to port back to
//reg   [8:0] cbcrmultr; // 1 extra bit for precision (before subtraction)
reg   [10:0] cbcrmultr; // 1 extra bit for precision (before subtraction)
//reg   [8:0] cbcr;      // after subraction (with extra bit preserved)
reg   [10:0] cbcr;      // after subraction (with extra bit preserved)
reg         sel_cbcrmult1; // 0 - use pdc[7:0], 1 - use y[7:0]. Should be valid 1 cycle ahead of ywe_r!
reg         use_cr;        // in this line cr is calculated. Valid during ywe_r and 1 cycle after
reg         sub_y;         // output accumulator/subtractor. 0 - load new data, 1 - subtract. Walid 2 cycles after ywe_r
wire        cwe0;          // preliminary cwe_r (to be modulated by odd/even pixels)
reg         cstrt;         //ystrt dealyed by 1
reg         cnxt;          // nxtline delayed by 1
reg         pre_sel_cbcrmult1;
// delaying, for now uing "old" ywe,cwe, yaddr,caddr - registering them on the output
 
always @ (posedge CLK) begin
//  if (~(ywe_r || ystrt || nxtline)) sel_cbcrmult1 <= ~(bayer_phase[1] ^ bayer_phase[0] ^ odd_line);
//  else      sel_cbcrmult1 <= ~sel_cbcrmult1;
  if (~(ywe_r || ystrt || nxtline)) pre_sel_cbcrmult1 <= ~(bayer_phase[1] ^ bayer_phase[0] ^ odd_line);
  else      pre_sel_cbcrmult1 <= ~pre_sel_cbcrmult1;
  
  sel_cbcrmult1 <=pre_sel_cbcrmult1;
  
  sub_y <= ~sel_cbcrmult1;
//  cbcrmult1 <= sel_cbcrmult1?y[7:0]:pdc[7:0];
  cbcrmult1 <= sel_cbcrmult1?y[7:0]:y0_r[7:0]; // delayed by 1 clock
  
  if (~ywe_r) use_cr <= ~(bayer_phase[1] ^ odd_line);
end
assign      cbcrmult2 = use_cr?m_cr:m_cb;  // maybe will need a register? (use_cr will still be good as it is valid early)
//assign      cbcrmulto = cbcrmult1*cbcrmult2;
assign      cbcrmulto = cbcrmult1*cbcrmult2_r;
reg [9:0] cbcrmult2_r; // will be one cycle later than cbcrmult2, but is still OK. Will be absorbed into the DSP block
// will preserve extra bit, but do not need to add half of the truncated MSB - on average there will be no shift after subtraction
always @ (posedge CLK) begin
  cbcrmult2_r <= cbcrmult2;
  cbcrmultr[10:0] <= cbcrmulto[17:7];
  cbcr[10:0] <= sub_y? (cbcr[10:0]-cbcrmultr[10:0]+ 1'b1):cbcrmultr[10:0];
end
//limit_diff
// Here 0 is shifted to 0x80
// new, q is signed char
  assign q[8:0]=  ((cbcr[10]==cbcr[9]) && (!limit_diff || (cbcr[10]==cbcr[8])))? cbcr[9:1]: {cbcr[10],limit_diff?cbcr[10]:(~cbcr[10]),{7{~cbcr[10]}}};

dly_16 #(.WIDTH(1)) i_cwe0 (.clk(CLK),.rst(1'b0), .dly(4'd1), .din(ywe_r), .dout(cwe0));
//SRL16 i_cwe0    (.D(ywe_r ),  .Q(cwe0), .A0(1'b1), .A1(1'b0), .A2(1'b0), .A3(1'b0), .CLK(CLK)); // dly=2=1+1



    always @ (posedge CLK) begin
        cstrt <= ystrt;
        cnxt  <= nxtline;
//        cwe_r <= cwe0 && sub_y;
        cwe_r <= cwe0 && !sel_cbcrmult1;
        caddr_r[2:0]<= cwe0?(caddr_r[2:0]+cwe_r):3'b0;
        if (cstrt)     caddr_r[6] <= ~bayer_phase[1];
        else if (cnxt) caddr_r[6] <= ~caddr_r[6];
        if (cstrt)     caddr_r[5:3] <=3'b0;
        else if (cnxt) caddr_r[5:3] <=(bayer_phase[1]^caddr_r[6])? caddr_r[5:3]:(caddr_r[5:3]+1);
    end
// extra signals delayed by 1 clock
    reg ywe_r2, cwe_r2;
    reg [6:0] caddr_r2;
    reg [7:0] yaddr_r2;
    always @ (posedge CLK) begin
        ywe_r2 <= ywe_r;
        cwe_r2 <= cwe_r;
        yaddr_r2 <= yaddr_r;
        caddr_r2 <= caddr_r;
    end


  always @ (posedge CLK) begin
    y_eq_0   <= (y0_r[7:0] == 8'h0);
    y_eq_255 <= (y0_r[7:0] == 8'hff);
    if (strt) n000_r[7:0] <= 8'h0;
    else if ((n000_r[7:0]!=8'hff) && y_eq_0 && ywe_r2) n000_r[7:0] <= n000_r[7:0]+1;
    if (strt) n255_r[7:0] <= 8'h0;
    else if ((n255_r[7:0]!=8'hff) && y_eq_255 && ywe_r2) n255_r[7:0] <= n255_r[7:0]+1;
  end


endmodule

