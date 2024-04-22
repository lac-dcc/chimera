--------------------------------------------------------------------------------
-- Fairchild F8 F351 PSU
--------------------------------------------------------------------------------
-- DO 8/2020
--------------------------------------------------------------------------------
-- With help from MAME F8 model

-- - 1kB ROM
-- - 2 8bits IO port
-- - Programmable timer
-- - Interrupts

--  MASK OPTIONS
--  - 1k ROM
--  - 6bits page select
--  - 6bits IO port address select
--  - 16bits interrupt address vector
--  - IO port output option

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

USE std.textio.ALL;

LIBRARY work;
USE work.base_pack.ALL;
USE work.f8_pack.ALL;

ENTITY f8_psu IS
  GENERIC (
    PAGE     : uv6;
    IOPAGE   : uv6;
    IVEC     : uv16;
    ROM      : arr_uv8(0 TO 1023)
    );
  PORT (
    dw       : IN  uv8; -- Data Write
    dr       : OUT uv8; -- Data Read
    dv       : OUT std_logic;

    romc     : IN  uv5;
    tick     : IN  std_logic;  -- 1/8 or 1/12 cycle length
    phase    : IN  uint4;

    ext_int  : IN  std_logic;
    int_req  : OUT std_logic;

    pri_o    : OUT std_logic;
    pri_i    : IN  std_logic;

    po_a     : OUT uv8; -- IO port A
    pi_a     : IN  uv8;

    po_b     : OUT uv8; -- IO port B
    pi_b     : IN  uv8;

    load_a   : IN uv10;
    load_d   : IN uv8;
    load_wr  : IN std_logic;

    clk      : IN std_logic;
    ce       : IN std_logic;
    reset_na : IN std_logic;

    pc0o     : OUT uv16;
    pc1o     : OUT uv16;
    dc0o     : OUT uv16
    );
END ENTITY f8_psu;

ARCHITECTURE rtl OF f8_psu IS

  SIGNAL dc0,dc1 : uv16;
  SIGNAL pc0,pc1 : uv16;

  SIGNAL mem : arr_uv8(0 TO 1023) :=ROM;
  SIGNAL mem_a : uv16;
  SIGNAL mem_dr,mem_dw : uv8;

  SIGNAL io_wr,io_rd : std_logic;
  SIGNAL io_port,io_dr,io_dw : uv8;
  SIGNAL po_a_l,po_b_l : uv8;
  SIGNAL tim : uv8;
  SIGNAL tdiv : uint5;
  SIGNAL icr : uv2;

  SIGNAL ext_int_d,tim_int_d,tim_int : std_logic;
  SIGNAL inta,inta_set,inta_clr : std_logic;
  SIGNAL int_req_l : std_logic;

BEGIN

  mem_a<=dc0 WHEN romc="00010" OR romc="00101" ELSE pc0;

  ----------------------------------------------------------
  -- ROMC BUS
  PROCESS(clk,reset_na) IS
    FUNCTION pchk(A : uv16) RETURN std_logic IS
    BEGIN
      RETURN to_std_logic(A(15 DOWNTO 10)=PAGE);
    END FUNCTION;
  BEGIN
    IF rising_edge(clk) THEN
      IF ce='1' THEN
        --dv<='0';
        inta_clr<='0';
        IF phase=2 THEN
          dv<='0';
        END IF;

        io_wr<='0';

        CASE romc IS
          WHEN "00000" =>
            -- S,L : Instruction fetch. The device whose address space includes
            -- the content of the PC0 register must place on the data bus
            -- the op code addressed by PC0. Then all devices increment
            -- the contents of PC0.
            IF phase=2 THEN
              dr <= mem_dr;
              dv <= pchk(pc0);
            END IF;
            IF phase=6 THEN
              pc0<= pc0 + 1;
            END IF;

          WHEN "00001" =>
            -- L   : The device whose address space includes the contents of
            -- the PC0 register must place on the data bus the contents of
            -- the memory location addressed by PC0. Then all devices add the
            -- 8-bit value on the data bus, as a signed binary number, to PC0.
            IF phase=2 THEN
              dr <= mem_dr;
              dv <= pchk(pc0);
            END IF;
            IF phase=6 THEN
              pc0<= pc0 + sext(dw,16);
            END IF;

          WHEN "00010" =>
            -- L   : The device whose DC0 addresses a memory word within the
            -- address space of that device must place on the data bus the
            -- contents of the memory location addressed by
            -- DC0. Then all devices increment DC0.
            IF phase=2 THEN
              dr <= mem_dr;
              dv <= pchk(dc0);
            END IF;
            IF phase=6 THEN
              dc0<= dc0 + 1;
            END IF;

          WHEN "00011" =>
            -- L,S : Similar to 00, except that it is used for Immediate Operand
            -- fetches (using PC0) instead of instruction fetches.
            IF phase=2 THEN
              dr <= mem_dr;
              dv <= pchk(pc0);
            END IF;
            IF phase=6 THEN
              pc0<= pc0 + 1;
              io_port<=dw;
            END IF;

          WHEN "00100" =>
            -- S   : Copy the contents of PC1 into PC0.
            IF phase=6 THEN
              pc0<= pc1;
            END IF;

          WHEN "00101" =>
            -- L   : Store the data bus contents into the memory
            -- location pointed to by DC0. Increment DC0.
            -- <ROM ! NO WRITE>
            --mem_a<=dc0;
            --IF phase=4 AND pchk(dc0)='1' THEN
            --  mem_wr<='1';
            --END IF;
            --IF phase=6 THEN
            --  dc0<=dc0 + 1;
            --END IF;

          WHEN "00110" =>
            -- L   : Place the high order byte of DC0 on the data bus.
            IF phase=2 THEN
              dr <=dc0(15 DOWNTO 8);
              dv <='1';
            END IF;

          WHEN "00111" =>
            -- L   : Place the high order byte of PC1 on the data bus.
            IF phase=2 THEN
              dr <=pc1(15 DOWNTO 8);
              dv <='1';
            END IF;

          WHEN "01000" =>
            -- L   : All devices copy the contents of PC0 into PC1. The CPU
            -- outputs zero on the data bus in this ROMC state. Load the
            -- data bus into both halves of PC0 thus clearing the register.
            IF phase=6 THEN
              pc1<=pc0;
              pc0<=x"0000";
            END IF;

          WHEN "01001" =>
            -- The device whose address space includes the contents of the DC0
            -- register must place the low order byte of DC0 onto the data bus.
            IF phase=2 THEN
              dr <=dc0(7 DOWNTO 0);
              dv <=pchk(dc0);
            END IF;

          WHEN "01010" =>
            -- L   : All devices add the 8-bit value on the data bus, treated
            -- as a signed binary number, to the Data Counter.
            IF phase=6 THEN
              dc0<=dc0 + sext(dw,16);
            END IF;

          WHEN "01011" =>
            -- L   : The device whose address space includes the value in PC1
            -- must place the low order byte of PC1 on the data bus.
            IF phase=2 THEN
              dr <=pc1(7 DOWNTO 0);
              dv <=pchk(pc1);
            END IF;

          WHEN "01100" =>
            -- L   : The device whose address space includes the contents of
            -- the PC0 register must place the contents of the memory word
            -- addressed by PC0 onto the data bus. Then all devices move the
            -- value which has just been placed on the data bus into the low
            -- order byte of PC0.
            IF phase=2 THEN
              dr <= mem_dr;
              dv <= pchk(pc0);
            END IF;
            IF phase=6 THEN
              pc0(7 DOWNTO 0)<= dw;
            END IF;

          WHEN "01101" =>
            -- S   : All devices store in PC1 the current contents of PC0,
            -- incremented by 1. PC0 is unaltered.
            pc1 <= pc0 +1;

          WHEN "01110" =>
            -- L   : The device whose address space includes the contents of
            -- PC0 must place the contents of the word addressed by PC0
            -- onto the data bus. The value on the data bus is then
            -- moved to the low order byte of DC0 by all devices
            IF phase=2 THEN
              dr <= mem_dr;
              dv <= pchk(pc0);
            END IF;
            IF phase=6 THEN
              dc0(7 DOWNTO 0)<= dw;
            END IF;

          WHEN "01111" =>
            -- L   : The interrupting device with highest priority must place
            -- the low order byte of the interrupt vector on the data bus.
            -- All devices must copy the contents of PC0 into PC1.
            -- All devices must move the contents of the data bus into
            -- the low order byte of PC0.
            IF phase=2 THEN
              dr <=IVEC(7 DOWNTO 0);
              dv <=int_req_l;
            END IF;
            IF phase=6 THEN
              pc1 <= pc0;
              pc0(7 DOWNTO 0) <= dw;
            END IF;

          WHEN "10000" =>
            -- L   : Inhibit any modification to the interrupt priority logic.
            -- <TODO>

          WHEN "10001" =>
            -- L   : The device whose memory space includes the contents of
            -- PC0 must place the contents of the addressed memory word
            -- on the data bus. All devices must then move the contents
            -- of the data bus to the upper byte of DC0.
            IF phase=2 THEN
              dr <=mem_dr;
              dv <=pchk(pc0);
            END IF;
            IF phase=6 THEN
              dc0(15 DOWNTO 8)<=dw;
            END IF;

          WHEN "10010" =>
            -- L   : All devices copy the contents of PC0 into PC1. All
            -- devices then move the contents of the data bus into
            -- the low order byte of PC0.
            IF phase=6 THEN
              pc1<=pc0;
              pc0(7 DOWNTO 0)<=dw;
            END IF;

          WHEN "10011" =>
            -- L   : The interrupting device with highest priority must move
            -- the high order half of the interrupt vector onto the data bus.
            -- All devices must move the contents of the data bus into the
            -- high order byte of PC0. The interrupting device will request
            -- its interrupt circuitry (so that it is no longer requesting CPU
            -- servicing and can respond to another interrupt).
            IF phase=2 THEN
              dr <=IVEC(15 DOWNTO 8);
              dv <=int_req_l;
            END IF;
            IF phase=6 THEN
              pc0(15 DOWNTO 8) <= dw;
              inta_clr<=int_req_l;
            END IF;

          WHEN "10100" =>
            -- L   : All devices move the contents of the data bus into the
            -- high order byte of PC0.
            IF phase=6 THEN
              pc0(15 DOWNTO 8)<=dw;
            END IF;

          WHEN "10101" =>
            -- L   : All devices move contents of the data bus into the
            -- high order byte of PC1.
            IF phase=6 THEN
              pc1(15 DOWNTO 8)<=dw;
            END IF;

          WHEN "10110" =>
            -- L   : All devices move the contents of the data bus into the
            -- high order byte of DC0.
            IF phase=6 THEN
              dc0(15 DOWNTO 8)<=dw;
            END IF;

          WHEN "10111" =>
            -- L   : All devices move the contents of the data bus into the
            -- low order byte of PC0.
            IF phase=6 THEN
              pc0(7 DOWNTO 0)<=dw;
            END IF;

          WHEN "11000" =>
            -- L   : All devices move contents of the data bus into the low
            -- order byte of PC1.
            IF phase=6 THEN
              pc1(7 DOWNTO 0)<=dw;
            END IF;

          WHEN "11001" =>
            -- L   : All devices move contents of the data bus into the low
            -- order byte of DC0.
            IF phase=6 THEN
              dc0(7 DOWNTO 0)<=dw;
            END IF;

          WHEN "11010" =>
            -- L   : During the prior cycle an I/O port timer or interrupt
            -- control register was addressed, The device containing
            -- the addressed port must move the current contents of
            -- the data bus into the addressed port.
            IF phase=6 THEN
              io_dw<=dw;
              io_wr<=to_std_logic(io_port(7 DOWNTO 2)=IOPAGE);
            END IF;

          WHEN "11011" =>
            -- L   : During the prior cycle the data bus specified the
            -- address of an I/O port. The device containing the
            -- addressed I/O port must place the contents of the I/O
            -- port on the data bus. (Note that the contents of timer
            -- and interrupt control retgisters cannot be read back onto
            -- the data bus.)
            IF phase=2 THEN
              io_rd<=to_std_logic(io_port(7 DOWNTO 2)=IOPAGE);
              dr<=io_dr;
              dv<=to_std_logic(io_port(7 DOWNTO 2)=IOPAGE);
            END IF;

          WHEN "11100" =>
            -- L/S : None. Before IO port access
            IF phase=6 THEN
              io_port<=dw;
            END IF;

          WHEN "11101" =>
            -- S   : Devices with DC0 and DC1 registers must switch registers.
            -- Devices without a DC1 register perform no operation.
            --IF phase=6 THEN
            --  dc0<=dc1;
            --  dc1<=dc0;
            --END IF;

          WHEN "11110" =>
            -- L   : The device whose address space includes the contents of
            -- PC0 must place the low order byte of PC0 onto the data bus.
            IF phase=2 THEN
              dr <=pc0(7 DOWNTO 0);
              dv <=pchk(pc0);
            END IF;

          WHEN "11111" =>
            -- L   : The device whose address space includes the contents of
            -- PC0 must place the high order byte of PC0 on the data bus.
            IF phase=2 THEN
              dr <=pc0(15 DOWNTO 8);
              dv <=pchk(pc0);
            END IF;

          WHEN OTHERS =>
            NULL;

        END CASE;

        IF reset_na='0' THEN
          pc0<=x"0000";
          pc1<=x"0000";
          dc0<=x"0000";
        END IF;
      END IF;
    END IF;
  END PROCESS;

  ----------------------------------------------------------
  -- ROM READ

  PROCESS(clk) IS
  BEGIN
    IF rising_edge(clk) THEN
      IF ce='1' THEN
        mem_dr<=mem(to_integer(mem_a(9 DOWNTO 0)));
      END IF;

      IF load_wr='1' THEN
        mem(to_integer(load_a))<=load_d;
      END IF;
    END IF;
  END PROCESS;

  ----------------------------------------------------------
  -- IO PORTS

  po_a<=po_a_l;
  po_b<=po_b_l;
  int_req<=int_req_l;

  PROCESS(clk,reset_na) IS
  BEGIN
    IF rising_edge(clk) THEN
      IF ce='1' THEN
        -------------------------------
        -- LFSR TIMER
        tdiv<=(tdiv+1) MOD 32;
        IF tdiv=0 THEN
          tim(0)<=(tim(3) XOR tim(4)) XNOR (tim(5) XOR tim(7));
          tim(7 DOWNTO 1)<=tim(6 DOWNTO 0);
        END IF;
        tim_int<=to_std_logic(tim=x"FE");
        tim_int_d<=tim_int;

        -- Interrupts
        ext_int_d<=ext_int;

        inta_set<=(NOT ext_int_d AND ext_int AND to_std_logic(icr="01")) OR
                  (NOT tim_int_d AND tim_int AND to_std_logic(icr="11"));

        inta <=(inta OR inta_set) AND NOT inta_clr;

        int_req_l<=inta AND pri_i;
        pri_o<=pri_i AND NOT inta;

        -------------------------------
        CASE io_port(1 DOWNTO 0) IS
          WHEN "00" => -- IO PORT A READ
            io_dr<=pi_a AND po_a_l;
          WHEN "01" => -- IO PORT B READ
            io_dr<=pi_b AND po_b_l;
          WHEN "10" => -- Interrupt control bits
            io_dr<=x"00"; -- <TBD>
          WHEN OTHERS => -- Timer
            io_dr<=x"00"; -- <TBD>
        END CASE;

        IF io_wr='1' THEN
          CASE io_port(1 DOWNTO 0) IS
            WHEN "00"   => po_a_l<=io_dw;
            WHEN "01"   => po_b_l<=io_dw;
            WHEN "10"   => tim<=io_dw;
            WHEN OTHERS => icr<=io_dw(1 DOWNTO 0);
          END CASE;
        END IF;

        IF reset_na='0' THEN
          po_a_l<=x"00";
          po_b_l<=x"00";
        END IF;
        -------------------------------
      END IF;
    END IF;
  END PROCESS;

  pc0o<=pc0;
  pc1o<=pc1;
  dc0o<=dc0;

END ARCHITECTURE rtl;