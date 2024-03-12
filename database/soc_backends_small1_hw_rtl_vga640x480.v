module vga(input  clk,      // system clock (100mhz)
           input             rst,

           input             clk25mhz, // vga pixel clock (25.13MHz)

           // one vmem port is used by the VGA module,
           // another is mmaped for the CPU.
           //
           // Spartan6 vmem is made of 3 x 2048*8 brams
           //
           // Layout:
           // 0-1023 - font rows for 127 "printable" characters
           // 1024-XXX - 80x60 chars vmem
           
           input [7:0]       vmem_data,
           output [12:0] vmem_addr,

           // Monochrome VGA pins
           output            hsync,
           output            vsync,
           output            rgb    // monochrome output, all three channels 0 or 1
           );




   reg [23:0] 		     blinkreg;
   always @(posedge clk)
     if (!rst)
       blinkreg <= 0;
     else
       blinkreg <= blinkreg + 1;
   

   // Pixels are fed via a small FIFO

   // vmem fsm:
   //   CHR0: start fetching next character -> CHRR
   //   CHRR: fetch a font row -> CHRR1
   //   CHRR1: push it into fifo or wait, -> CHR0/EOL
   //   EOL: increment row -> CHR0/VSYNC
   //   VSYNC: start over again -> CHR0

   reg                   fifo_en;
   reg                   fifo_rd;
   
   reg [7:0]             fifo_in;
   wire                  fifo_full;
   wire [7:0]            fifo_out;
   wire                  fifo_empty;
   

   smallfifo1 fifo1(.rst(rst),
                   
                   .clk_in(clk),
                   .fifo_in(fifo_in),
                   .fifo_en(fifo_en),
                   .fifo_full(fifo_full),

                   .clk_out(clk25mhz),
                   .fifo_out(fifo_out),
                   .fifo_empty(fifo_empty),
                   .fifo_rd(fifo_rd));
   
   reg [2:0]             fontrow;
   reg [12:0]            chrpos;
   reg [12:0]            chrrowpos;
   wire [12:0]           chrposnxt;

   assign chrposnxt = chrpos + 1;
   wire                  chr_eol;
   reg [7:0]             lineno;
   reg [7:0]             colno;
   
   assign chr_eol = (colno)>=79;
   
   reg [7:0]             ascii;

   reg [3:0]             chrstate;

   wire [12:0]           addr_chr0;
   wire [12:0]           addr_chrr;
   
   assign addr_chr0 = chrpos;
   assign addr_chrr = {4'b0,ascii[6:0],fontrow[2:0]};

   parameter VMEMSTART = 1024;
   parameter VMEMEND   = 1024 + 80*60;

   parameter S_VSYNC = 0;
   parameter S_CHR0  = 1;
   parameter S_CHRR  = 2;
   parameter S_CHRR1 = 3;
   parameter S_EOL   = 4;


   assign vmem_addr = chrstate==S_CHR0?addr_chr0:addr_chrr;

   
   
   always @(posedge clk)
     if (!rst) begin
        fifo_en <= 0;
        fontrow <= 0;
        chrpos <= VMEMSTART;
        chrrowpos <= VMEMSTART;
        chrstate <= S_VSYNC;
        ascii <= 0;
        fifo_in <= 0;
        lineno <= 0;
        colno <= 0;
     end else begin // if (!rst)
        case(chrstate)
          S_VSYNC: begin
             fontrow <= 0;
             chrpos  <= VMEMSTART;
             chrrowpos  <= VMEMSTART;
             chrstate <= S_CHR0;
             lineno <= 0;
             colno <= 0;
          end
          S_CHR0: begin
             fifo_en <= 0;
             //vmem_addr <= addr_chr0;
             chrstate <= S_CHRR;
          end
          S_CHRR: begin
             ascii <= vmem_data;
             //vmem_addr <= addr_chrr;
             chrstate <= S_CHRR1;
          end
          S_CHRR1: begin
             if (~fifo_full) begin
                chrpos <= chrposnxt;
                colno <= colno + 1;
                fifo_in <= (blinkreg[23] & ascii[7])?vmem_data^8'hff:vmem_data; // bit 8 = inv
                fifo_en <= 1;
                if (chr_eol) begin
                   chrstate <= S_EOL;
                end else begin
                   chrstate <= S_CHR0;
                end
             end else begin
                chrstate <= S_CHRR1; // keep banging the same row
             end
          end // case: CHRR1
          S_EOL: begin
             fifo_en <= 0;
             colno <= 0;
             // a next font row or a next char row
             if (fontrow<7) begin
                fontrow <= fontrow + 1;
                chrpos <= chrrowpos; // back to the beginning of the same char row
                chrstate <= S_CHR0;
             end else begin
                fontrow <= 0;
                lineno <= lineno + 1;
                if (lineno >= 59) begin
                   chrstate <= S_VSYNC;
                end else begin
                   chrrowpos <= chrpos; // start the next row
                   chrstate <= S_CHR0;
                end
             end
          end
        endcase
     end

   //// bang pixels
   reg [9:0] hcounter;
   reg [9:0] vcounter;
   reg       ready;
   wire      visible;

   parameter hlen = 640;
   parameter hpulse = 96;
   parameter hfp = 16;
   parameter hbp = 48;
   parameter vlen = 480;
   parameter vfp = 10;
   parameter vbp = 33;
   parameter vpulse = 2;

   parameter hlen1 = hlen + hpulse + hfp + hbp;
   parameter vlen1 = vlen + vpulse + vfp + vbp;
   
  
   assign hsync = ~((hcounter > hlen+hfp) & (hcounter < hlen+hfp+hpulse));
   assign vsync = ~((vcounter > vlen+vfp) & (vcounter < vlen+vfp+vpulse));
   
   assign visible = (hcounter < hlen)&&(vcounter < vlen);
   
   always @(posedge clk25mhz)
     if (!rst || !ready) begin // only start banging when there are some bits queued already
        vcounter <= 0;
        hcounter <= 0;
     end else begin
        if (hcounter >= hlen1-1) begin
           hcounter <= 0;
           if (vcounter >= vlen1-1)
             vcounter <= 0;
           else
             vcounter <= vcounter + 1;
        end else hcounter <= hcounter + 1;
     end // else: !if(!rst)

   // While in a visible area, keep sucking bits from the fifo, hoping it is being well fed
   // on the other side.
   reg [7:0] fontbits;
   reg [7:0] fontnext;
   
   wire      nextbit;
   assign nextbit = fontbits[7];
   assign rgb = visible?nextbit:0;
   
   reg [2:0] bitcount;
   reg       getnext;

   // What a mess!!!
   always @(posedge clk25mhz)
     if (!rst) begin
        bitcount <= 0;
        fontbits <= 0;
        fontnext <= 0;
        ready <= 0;
        fifo_rd <= 0;
        getnext <= 0;
     end else begin
        if (!ready) begin
           if (fifo_rd) begin
              fifo_rd <= 0;
              fontbits <= fifo_out;
              ready <= 1;
	      bitcount <= 7;
           end else fifo_rd <= 1;
        end else
          if (visible) begin
             if (bitcount < 7) begin
                bitcount <= bitcount + 1;
                fontbits <= fontbits << 1;
                if (fifo_rd) begin
                   fontnext <= fifo_out;
                   fifo_rd <= 0;
                   getnext <= 0;
                end else 
                  if ((bitcount > 4) && getnext) begin
                    fifo_rd <= 1;
                  end
             end else begin // if (bitcount < 7)
                fifo_rd <= 0;
                bitcount <= 0;
                fontbits <= fontnext;
                getnext <= 1;
             end
          end else begin
	     fifo_rd <= 0; // if (visible)
	     fontbits <= fontnext;
	  end
     end
   
endmodule
