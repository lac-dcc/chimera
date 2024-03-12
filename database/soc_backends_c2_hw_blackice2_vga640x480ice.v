module vga640x480ice(input  clk,      // system clock
                     input         clk25mhz,
                     input         rst,
              
                     input [15:0]  sram_in,
                     output [17:0] sram_adr_vga,
                     output reg    data_rq_vga,
                     input         grant_vga,
              
                     // Monochrome VGA pins
                     output        hsync,
                     output        vsync,
                     output [2:0]  rgb    // monochrome output, all three channels 0 or 1
                     );

   // Pixels are fed via a small FIFO
   reg                   fifo_en;
   reg                   fifo_rd;
   
   wire [15:0]           fifo_in;
   wire                  fifo_full;
   wire [15:0]           fifo_out;
   wire                  fifo_empty;

   reg [17:0]            vmpos;
   assign sram_adr_vga = vmpos[17:0];
   assign fifo_in = sram_in;
   
   parameter VMEM_END = (640*480/16) - 1;

   smallfifo16 fifo1(.rst(rst),
                   
                     .clk_in(clk),
                     .fifo_in(fifo_in),
                     .fifo_en(fifo_en),
                     .fifo_full(fifo_full),
                     
                     .clk_out(clk25mhz),
                     .fifo_out(fifo_out),
                     .fifo_empty(fifo_empty),
                     .fifo_rd(fifo_rd));

   
   // Just feed the FIFO with vmem contents
   always @(posedge clk)
     if (!rst) begin
        fifo_en <= 0;
        data_rq_vga <= 0;
        vmpos <= 0;
     end else begin // if (!rst)
        if (!fifo_full && !fifo_en && !grant_vga) begin
           data_rq_vga <= 1;
        end if (fifo_en && data_rq_vga) begin
           data_rq_vga <= 0;
           fifo_en <= 0;
        end else if (!fifo_full && !fifo_en && grant_vga) begin
           if (vmpos < VMEM_END) vmpos <= vmpos + 1;
           else begin
              vmpos <= 0;
           end
           fifo_en <= 1;
        end else begin
           fifo_en <= 0;
        end
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
   reg [15:0] fontbits;
   reg [15:0] fontnext;
   
   wire      nextbit;
   assign nextbit = fontbits[15];
   assign rgb = visible?{nextbit, nextbit,nextbit}:3'b0;
   
   reg [3:0] bitcount;
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
	      bitcount <= 15;
           end else fifo_rd <= 1;
        end else
          if (visible) begin
             if (bitcount < 15) begin
                bitcount <= bitcount + 1;
                fontbits <= fontbits << 1;
                if (fifo_rd) begin
                   fontnext <= fifo_out;
                   fifo_rd <= 0;
                   getnext <= 0;
                end else 
                  if ((bitcount > 8) && getnext) begin
                    fifo_rd <= 1;
                  end
             end else begin // if (bitcount < 15)
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
