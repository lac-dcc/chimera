-- ahbfile demonstration design
-- Martin Aberg, 2015

library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.amba.all;
use grlib.stdlib.all;
library techmap;
use techmap.gencomp.all;
library gaisler;
use gaisler.leon3.all;
use gaisler.uart.all;
use gaisler.misc.all;
use work.config.all;

entity leon3mp is
  generic (
    fabtech   : integer := CFG_FABTECH;
    memtech   : integer := CFG_MEMTECH;
    padtech   : integer := CFG_PADTECH;
    disas     : integer := CFG_DISAS; -- Enable disassembly to console
    dbguart   : integer := CFG_DUART; -- Print UART on console
    pclow     : integer := CFG_PCLOW
  );
  port (
    rstn  : in  std_ulogic;
    clk   : in  std_ulogic
	);
end;

architecture rtl of leon3mp is

constant nahbm : integer := CFG_NCPU*CFG_LEON3 + 1;
constant nahbs : integer := CFG_DSU*CFG_LEON3 + CFG_AHBRAMEN + 1;

signal apbi  : apb_slv_in_type;
signal apbo  : apb_slv_out_vector := (others => apb_none);
signal ahbsi : ahb_slv_in_type;
signal ahbso : ahb_slv_out_vector := (others => ahbs_none);
signal ahbmi : ahb_mst_in_type;
signal ahbmo : ahb_mst_out_vector := (others => ahbm_none);

signal u1i    : uart_in_type;
signal u1o    : uart_out_type;

signal irqi : irq_in_vector(0 to CFG_NCPU-1);
signal irqo : irq_out_vector(0 to CFG_NCPU-1);

signal dbgi : l3_debug_in_vector(0 to CFG_NCPU-1);
signal dbgo : l3_debug_out_vector(0 to CFG_NCPU-1);

signal dsui : dsu_in_type;
signal dsuo : dsu_out_type; 

signal gpti : gptimer_in_type;

signal gpioi : gpio_in_type;
signal gpioo : gpio_out_type;
begin

  ahb0 : ahbctrl
    generic map (
      defmast => CFG_DEFMST,
      rrobin => CFG_RROBIN,
      split => CFG_SPLIT,
      fpnpen => CFG_FPNPEN,
      ioaddr => CFG_AHBIO,
      ioen => 1,
      nahbm => nahbm,
      nahbs => nahbs
    )
    port map (rstn, clk, ahbmi, ahbmo, ahbsi, ahbso);

  l3 : if CFG_LEON3 = 1 generate
    cpu : for i in 0 to CFG_NCPU-1 generate
      u0 : leon3s
        generic map (
          i, fabtech, memtech, CFG_NWIN, CFG_DSU, CFG_FPU, CFG_V8, 0, CFG_MAC,
          pclow, CFG_NOTAG, CFG_NWP, CFG_ICEN, CFG_IREPL, CFG_ISETS, CFG_ILINE,
          CFG_ISETSZ, CFG_ILOCK, CFG_DCEN, CFG_DREPL, CFG_DSETS, CFG_DLINE,
          CFG_DSETSZ, CFG_DLOCK, CFG_DSNOOP, CFG_ILRAMEN, CFG_ILRAMSZ,
          CFG_ILRAMADDR, CFG_DLRAMEN, CFG_DLRAMSZ, CFG_DLRAMADDR, CFG_MMUEN,
          CFG_ITLBNUM, CFG_DTLBNUM, CFG_TLB_TYPE, CFG_TLB_REP,
          CFG_LDDEL, disas, CFG_ITBSZ, CFG_PWD, CFG_SVT, CFG_RSTADDR, CFG_NCPU-1,
          CFG_DFIXED, CFG_SCAN, CFG_MMU_PAGE, CFG_BP, CFG_NP_ASI, CFG_WRPSR
        )
        port map (
          clk, rstn, ahbmi, ahbmo(i), ahbsi, ahbso, irqi(i), irqo(i), dbgi(i),
          dbgo(i)
        );
    end generate;
--    errorn_pad : odpad generic map (tech => padtech) port map (errorn, dbgo(0).error);
  
    dsugen : if CFG_DSU = 1 generate
      dsu0 : dsu3
        generic map (
          hindex => 0,
          haddr => 16#900#,
          hmask => 16#F00#,
          ncpu => CFG_NCPU,
          tbits => 30,
          tech => memtech,
          irq => 0,
          kbytes => CFG_ATBSZ
        )
        port map (
          rstn, clk, ahbmi, ahbsi, ahbso(0), dbgo, dbgi, dsui, dsuo
        );
        dsui.enable <= '1';
        dsui.break <= '0';
--      dsuen_pad : inpad generic map (tech => padtech) port map (dsuen, dsui.enable); 
--      dsubre_pad : inpad generic map (tech => padtech) port map (dsubre, dsui.break); 
--      dsuact_pad : outpad generic map (tech => padtech) port map (dsuact, dsuo.active);
    end generate;
  end generate;

  nodsu : if CFG_DSU = 0 generate 
    dsuo.tstop <= '0';
    dsuo.active <= '0';
  end generate;

  ahbfile0 : entity work.ahbfile
    generic map (
      hindex => nahbm-1
    )
    port map (
      rstn,
      clk,
      ahbmi,
      ahbmo(nahbm-1)
    );

  apb0 : apbctrl
    generic map (
      hindex => nahbs-1,
      haddr => CFG_APBADDR
    )
    port map (rstn, clk, ahbsi, ahbso(nahbs-1), apbi, apbo);

  ua1 : if CFG_UART1_ENABLE /= 0 generate
    uart1 : apbuart
      generic map (
        pindex => 1,
        paddr => 1,
        pirq => 2,
        console => dbguart,
	      fifosize => CFG_UART1_FIFO
      )
      port map (rstn, clk, apbi, apbo(1), u1i, u1o);
    u1i.extclk <= '0';
    u1i.ctsn <= '0';
    u1i.rxd <= '1';
    --txd1 <= u1o.txd;
  end generate;

  irqctrl : if CFG_IRQ3_ENABLE /= 0 generate
    irqctrl0 : irqmp
      generic map (
        pindex => 2,
        paddr => 2,
        ncpu => CFG_NCPU
      )
      port map (rstn, clk, apbi, apbo(2), irqo, irqi);
  end generate;
  irq3 : if CFG_IRQ3_ENABLE = 0 generate
    x : for i in 0 to CFG_NCPU-1 generate
      irqi(i).irl <= "0000";
    end generate;
  end generate;

  gpt : if CFG_GPT_ENABLE /= 0 generate
    timer0 : gptimer
      generic map (
        pindex => 3,
        paddr => 3,
        pirq => CFG_GPT_IRQ,
        sepirq => CFG_GPT_SEPIRQ,
        sbits => CFG_GPT_SW,
        ntimers => CFG_GPT_NTIM, 
	      nbits => CFG_GPT_TW,
        wdog => CFG_GPT_WDOG
      )
    port map (rstn, clk, apbi, apbo(3), gpti, open);
    gpti <= gpti_dhalt_drive(dsuo.tstop);
  end generate;

  gpio0 : if CFG_GRGPIO_ENABLE /= 0 generate
    grgpio0: grgpio
      generic map (
        pindex => 11,
        paddr => 11,
        imask => CFG_GRGPIO_IMASK,
        nbits => CFG_GRGPIO_WIDTH
      )
      port map (rstn, clk, apbi, apbo(11), gpioi, gpioo);

--    pio_pads : for i in 0 to CFG_GRGPIO_WIDTH-1 generate
--      pio_pad : iopad
--        generic map (tech => padtech)
--        port map (gpio(i), gpioo.dout(i), gpioo.oen(i), gpioi.din(i));
--    end generate;
   end generate;

  ocram : if CFG_AHBRAMEN = 1 generate 
    ahbram0 : ahbram
      generic map (
        hindex => CFG_LEON3*CFG_DSU,
        haddr => CFG_AHBRADDR,
        tech => CFG_MEMTECH,
        kbytes => CFG_AHBRSZ,
        pipe => CFG_AHBRPIPE
      )
      port map (rstn, clk, ahbsi, ahbso(CFG_LEON3*CFG_DSU));
  end generate;

-----------------------------------------------------------------------
---  Boot message  ----------------------------------------------------
-----------------------------------------------------------------------

-- pragma translate_off
  x : report_design
  generic map (
   msg1 => "LEON3 MP Demonstration design",
   fabtech => tech_table(fabtech), memtech => tech_table(memtech),
   mdel => 1
  );
-- pragma translate_on
end;
