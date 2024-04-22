-- Memory mapper mk 2.
--
-- A simple memory mapping unit for a 6809 multicomp. Aims to provide a superset
-- of the capability of the coco unit, but is NOT register-compatible. Also
-- provides a 50Hz timer interrupt and a self-NMI control that allows code
-- single-step.
--
-- The operation is fully synchronous on the master clock; a clock enable
-- determines when the state changes. (Obviously) the state can only be allowed
-- to change at the same time as the CPU address bus else the address or control
-- for a cycle will glitch.
--
-- Design by Neal Crook foofoobedoo@gmail.com Jun2015.
--
-- You are free to use this file in your own projects but must never charge for
-- it nor use it without acknowledgement.
--
-- Reference: The NitrOS-9 Project documentation wiki, "The Kernel"
--
-- OVERVIEW OF MMU OPERATION
-- =========================
--
-- The 6809 can address 64KBytes of memory directly, through a 16-bit address
-- bus. This will be referred to as the "logical address space". The MMU
-- considers the logical address space as 8, 8KByte blocks. Address bits
-- [15:13] identify a logical block number (0-7, 8 in total).
--
-- Up to 1MByte of RAM is supported, referred to as the "physical
-- address space" and needing 20-bit address bus. Address bits [19:13]
-- identify a physical block number (0-127, 128 in total).
--
-- Within the MMU, 6809 address lines [15:13] are used to index a
-- programmable look-up table. Each entry in the table holds a physical
-- block number, which is driven out as address lines/chip selects to RAM.
--
-- There are 16 entries in the table, arranged in two groups of 8. A register
-- bit "TR" is used to select which group is used. This allows software to
-- switch rapidly between two sets of mappings.
--
-- To program a table entry you first select the table entry using a write
-- to one register then select the physical physical block number for that
-- entry using a write to another register. These two operations can be
-- combined into a single 16-bit write.
--
-- Each physical block can be write-protected so that it acts like ROM.
--
-- Logical block 7 ($E000-FFFF) acts differently in three ways:
-- 1. The boot ROM sits in this block, overlaying any RAM that is mapped
--    there. The ROM is enabled after reset but can be disabled by a
--    register write.
-- 2. The multicomp I/O is decoded in this block, in address range
--    $FFD0-$FFDF. The I/O is always present. If you map ROM to this
--    block, accesses to ROM are ignored and I/O is accessed instead.
--    If you map RAM to this block, write accesses go to I/O and to
--    RAM (ie, the RAM locations at $FFD0-$FFDF are corrupted).
-- 3. When the "Fixed RAM Top" (FRT) is enabled, the address range
--    $FE00-FFCF, $FFE0-$FFFF are *always* mapped to physical RAM
--    block 7. This 256byte region is the "vector page" on the COCO
--    (interrupted here by the I/O space). This special mapping is
--    performed for both reads and writes. Furthermore, when this
--    mapping is enabled, I/O writes will corrupt the associated
--    locations in physical RAM block 7, regardless of what RAM block
--    is mapped into logical block 7.
--
-- At reset, the MMU is disabled (giving a 1-1 mapping) and the ROM
-- is (re-)enabled, but the mapping registers themselves are NOT reset.
--
-- MMU PROGRAMMING INTERFACE
-- =========================
--
-- The software interface is through 2 write-only registers that
-- occupy unused addresses in the SDCARD address space:
-- $FFDE MMUADR
-- $FFDF MMUDAT
--
-- MMUADR
-- b7       ROMDIS Disable ROM. 0 after reset.
-- b6       TR     Select upper group of mapping registers.
-- b5       MMUEN  Enable MMU. 0 after reset.
-- b4       NMI bit.
-- b3       } MAPSEL Select mapping register to
-- b2       } write through MMUDAT. MAPSEL values 0-7 control
-- b1       } the address translation when TR=0, MAPSEL values
-- b0       } 8-15 control the address translation when TR=1.
--
-- MMUDAT
-- b7       WRPROT When 1 the physical block is read-only
-- b6       } Physical block number associated with the logical
-- b5       } block selected by the current value of MAPSEL.
-- b4       }
-- b3       }
-- b2       }
-- b1       }
-- b0       }
--
-- Magic: for NitrosL2, want a fixed 512byte region of r/w memory
-- at the top of the address space. There is no space to provide
-- an enable for this behaviour (which I call FRT for FixedRamTop)
-- and so some special magic is used, as follows:
--
-- IF ROMDIS=1 & MMUEN=1 then a write with b4=0 (see NMI behaviour
-- below) and b7=0 and b5=1 does NOT enable the ROM but actually
-- sets FRT=1. Any write with MMUEN=0 sets FRT=0 again. In summary:
-- Current           Action        End State
-- -----------------+-------------+-----------------
-- ROMDIS MMUEn FRT  ROMDIS MMUEn  ROMDIS MMUEn FRT
-- x      x     x    RESET         0      0     0
-- x      x     x    0      1      0      1     x
-- x      x     x    1      1      1      1     x
-- x      x     x    x      0      x      0     0
-- 1      1     x    0      1      1      1     1
--
-- If you select a physical block that is outside the actual size
-- of your RAM, the behaviour is undefined (it will probably alias).
--
-- When MMUEN=0, logical blocks 0-7 are mapped to physical blocks 0-7.
--
-- You can write MMUDAT, MMUADR as separate 8-bit stores or as a 16-bit
-- store.
--
-- The NMI bit should be set using an 8-bit store. On writes to
-- MMUADR with bit4=1, the state of the other data bits is ignored
-- (they do not change). The avoids the need to know the current
-- state of any of the other bits. The NMI bit is self-clearing and
-- generates an NMI edge after a specific delay. As part of a
-- carefully-controlled code sequence it can be used to interrupt
-- after execution of a single instruction (see SINGLE STEP, below)
--
-- Remember, these two registers are WRITE-ONLY!
--
-- TIMER PROGRAMMING INTERFACE
-- ===========================
--
-- The timer provides a regular interrupt 50 times a second by dividing
-- down the 50MHz master input clock.
--
-- The programming interface is a single r/w register:
-- $FFDD TIMER
--
-- The behaviour of this register is designed to allow simple and efficient
-- software handling of the interrupt.
-- At reset, the timer is disabled and the interrupt is deasserted.
-- bit[1] is read/write, timer enable.
-- bit[7] is read/write-1-to-clear, interrupt.
--
-- In an ISR the timer can be serviced by performing an INC on its address
--
-- Read  Write  Comment
--  n/a   $02   Enable timer
--  $00   $01   Timer was and remains disabled. N=0.
--  $02   $03   Timer was and remains enabled, no interrupt. N=0.
--  $80   $81   Timer was and remains disabled, old pending interrupt cleared.
--              N=1.
--  $82   $83   Timer was and remains enabled,  old pending interrupt cleared.
--              N=1.
--
--
-- SINGLE STEP
-- ===========
--
-- Start with the application context stored on the system stack. The stacked
-- copy of PC points to the next instruction to be executed. The stacked CC has
-- the E (entire) bit set. Now execute (exactly) this code sequence:
--
--   LDA #$10      * set bit 4
--   STA MMUADR    * trigger NMI
--   RTI           * resume application
--
-- The RTI restores the application context from the system stack. The NMI is
-- generated on the first instruction executed at the recovered PC, so that this
-- instruction executes to completion and then the processor stacks the application
-- context and continues execution at the address indicated by the NMI exception
-- vector.
--
-- The NMI service routine can perform the same code sequence to do another single
-- step.


-- TODO: write of $80 to TIMER should always result in read-back of 0. If the interrupt
-- asserts on the same edge as a write of $80 is detected, the clear-down effect
-- of b7 should override so that the interrupt never asserts. Test in simulation?
-- TODO: is this timer interface efficient for sw dealing with xple interrupts?
-- TODO: MMUEN shaves ~1MHz off fmax. Consider removing it!

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mem_mapper2 is
port (
        n_reset : in std_logic;
        clk     : in std_logic;
        hold    : in std_logic;
        -- conditioned with chip select externally
        n_wr    : in std_logic;
        dataIn  : in std_logic_vector(7 downto 0);
        dataOut : out std_logic_vector(7 downto 0);
        -- select internal control register
        regAddr : in std_logic_vector(2 downto 0);
        -- incoming CPU address to decode
        cpuAddr : in std_logic_vector(15 downto 9);			-- MODIFIED
        -- high-order lines to external RAM - upto 512x8.
        ramAddr : out std_logic_vector(18 downto 13);
        -- RAM chip select - upto 2 devices.
        n_ramCSHi : out std_logic;
        n_ramCSLo : out std_logic;
        ramWrInhib : out std_logic;
        romInhib   : out std_logic;
        -- timer interrupt
        n_tint  : out std_logic;
        -- single-step interrupt
        nmi     : out std_logic;
        -- for debug
        frt  : out std_logic
);

end mem_mapper2;

architecture rtl of mem_mapper2 is

  -- state
  signal map0 : std_logic_vector(7 downto 0);
  signal map1 : std_logic_vector(7 downto 0);
  signal map2 : std_logic_vector(7 downto 0);
  signal map3 : std_logic_vector(7 downto 0);
  signal map4 : std_logic_vector(7 downto 0);
  signal map5 : std_logic_vector(7 downto 0);
  signal map6 : std_logic_vector(7 downto 0);
  signal map7 : std_logic_vector(7 downto 0);
  signal map8 : std_logic_vector(7 downto 0);
  signal map9 : std_logic_vector(7 downto 0);
  signal mapa : std_logic_vector(7 downto 0);
  signal mapb : std_logic_vector(7 downto 0);
  signal mapc : std_logic_vector(7 downto 0);
  signal mapd : std_logic_vector(7 downto 0);
  signal mape : std_logic_vector(7 downto 0);
  signal mapf : std_logic_vector(7 downto 0);
  signal mmuEn : std_logic;
  signal mapSel : std_logic_vector(3 downto 0);
  signal tr : std_logic;
  signal frt_i : std_logic;

  -- convenience
  signal index : std_logic_vector(3 downto 0);
  signal val   : std_logic_vector(7 downto 0);

  -- timer stuff
  constant TMIN : integer := 0;
  constant TMAX : integer := 999999; -- count from 0..TMAX
--  constant TMAX : integer := 200; -- for simulation debug
  signal tcount : integer range TMIN to TMAX;
  signal n_tint_i : std_logic;
  signal tenable : std_logic;
  signal tstat : std_logic_vector(7 downto 0);

  -- nmi stuff
  constant NMILIM : integer := 16;
  signal nmi_i : std_logic;
  signal nmiDly : integer range 0 to (NMILIM + 1);

  -- rom control stuff
  signal romInhib_i : std_logic;


begin
  -- outputs
  ramAddr <= val(5 downto 0);
  n_ramCSHi <= not val(6);
  n_ramCSLo <= val(6);
  ramWrInhib <= val(7);
  n_tint <= n_tint_i;
  nmi <= nmi_i;
  romInhib <= romInhib_i;
  frt <= frt_i;

  index <= tr & cpuAddr(15 downto 13);
  tstat <= not n_tint_i & "00000" & tenable & '0';

  -- register read: must return 0 when not accessed, because read data
  -- is ORed with read data from sd_controller.
  dataOut <= tstat when regAddr = "101" else
             x"00";

  -- decode
  amap: process(index, cpuAddr, frt_i, mmuEn, map0, map1, map2, map3, map4, map5, map6, map7,
                map8, map9, mapa,mapb,mapc, mapd, mape, mapf)
    begin
      if (mmuEn = '0') or (frt_i = '1' and cpuAddr(15 downto 9) = "1111111") then
        -- EITHER the mmu is disabled - in which case we want a flat 1-to-1
        -- mapping
        -- OR the fixed RAM top is enabled, so that the top 512 bytes come
        -- from the top of 1-1 mapped space. ie: from top of block7 (in the
        -- first RAM device). The mapping is the same in both cases (in the
        -- latter case, cpuAddr(15 downto 13) is already Known to be "111".
        val <= "00000" & cpuAddr(15 downto 13);
      else
        case index is
          when "0000" => val <= map0;
          when "0001" => val <= map1;
          when "0010" => val <= map2;
          when "0011" => val <= map3;
          when "0100" => val <= map4;
          when "0101" => val <= map5;
          when "0110" => val <= map6;
          when "0111" => val <= map7;
          when "1000" => val <= map8;
          when "1001" => val <= map9;
          when "1010" => val <= mapa;
          when "1011" => val <= mapb;
          when "1100" => val <= mapc;
          when "1101" => val <= mapd;
          when "1110" => val <= mape;
          when "1111" => val <= mapf;
          when others => val <= map0;
        end case;
      end if;
    end process;

  -- state
  proc_reg: process(clk, n_reset)
    begin
      if n_reset='0' then
        romInhib_i <= '0';
        frt_i <= '0';
        mmuEn <= '0';
        --
        n_tint_i <= '1';
        tcount <= TMIN;
        tenable <= '0';
        --
        nmi_i <= '0';
        nmiDly <= 0;
      elsif rising_edge(clk) then
        -- timer
        if (tenable = '0') then
          tcount <= TMIN;
        else
          if tcount = TMAX then
            n_tint_i <= '0';
            tcount <= TMIN;
          else
            tcount <= tcount + 1;
          end if;
        end if;
        -- write to TIMER2
        if hold = '0' and n_wr = '0' and regAddr = "101" then
          -- bit 1 is enable
          tenable <= dataIn(1);
          -- bit 7 write-1-to-clear
          if n_tint_i = '0' and dataIn(7) = '1' then
            n_tint_i <= '1';
          end if;
        end if;

        -- write to MMUADR
        if hold = '0' and n_wr = '0' and regAddr = "110" then
          -- Magic: if bit[4] (NMI), ignore any other write data
          -- (register is WO and this saves us having to know any
          -- existing state)
          if dataIn(4) = '1' then
            -- initate NMI sequence
            nmiDly <= 1;
          else
            -- More magic: need a control bit to enable a fixed RAM
            -- RAM region at the top of memory, but there is no
            -- spare control bit. Instead, detect the situation where
            -- (i) ROM is disabled (ii) MMU is enabled (iii) ROM gets
            -- enabled again. In this case, instead of enabling
            -- the ROM, we enabled the fixed RAM region.
            if romInhib_i = '1' and mmuEn = '1' and dataIn(7) = '0' and dataIn(5) = '1' then
              romInhib_i <= '1';
              frt_i      <= '1';
              tr         <= dataIn(6);
              mmuEn      <= dataIn(5);
              mapSel     <= dataIn(3 downto 0);
            else
              romInhib_i <= dataIn(7);
              frt_i      <= frt_i and dataIn(5); -- clear when MMU disabled
              tr         <= dataIn(6);
              mmuEn      <= dataIn(5);
              mapSel     <= dataIn(3 downto 0);
            end if;
          end if;
        end if;

        if hold = '0' and nmiDly /= 0 then
          if (nmi_i = '1') then
            nmi_i <= '0';
            nmiDly <= 0;
          else
            nmiDly <= nmiDly + 1;
            if (nmiDly = NMILIM) then
              nmi_i <= '1';
            end if;
          end if;
        end if;

        -- write to MMUDAT
        if hold = '0' and n_wr = '0' and regAddr = "111" then
          if mapSel = "0000" then map0 <= dataIn; end if;
          if mapSel = "0001" then map1 <= dataIn; end if;
          if mapSel = "0010" then map2 <= dataIn; end if;
          if mapSel = "0011" then map3 <= dataIn; end if;
          if mapSel = "0100" then map4 <= dataIn; end if;
          if mapSel = "0101" then map5 <= dataIn; end if;
          if mapSel = "0110" then map6 <= dataIn; end if;
          if mapSel = "0111" then map7 <= dataIn; end if;
          if mapSel = "1000" then map8 <= dataIn; end if;
          if mapSel = "1001" then map9 <= dataIn; end if;
          if mapSel = "1010" then mapa <= dataIn; end if;
          if mapSel = "1011" then mapb <= dataIn; end if;
          if mapSel = "1100" then mapc <= dataIn; end if;
          if mapSel = "1101" then mapd <= dataIn; end if;
          if mapSel = "1110" then mape <= dataIn; end if;
          if mapSel = "1111" then mapf <= dataIn; end if;
        end if;
      end if;
    end process;

end rtl;
