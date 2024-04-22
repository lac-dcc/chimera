--
-- Z80 compatible microprocessor core, asynchronous top level
--
-- Version : 0247a
--
-- Copyright (c) 2001-2002 Daniel Wallner (jesus@opencores.org)
--
-- All rights reserved
--
-- Redistribution and use in source and synthezised forms, with or without
-- modification, are permitted provided that the following conditions are met:
--
-- Redistributions of source code must retain the above copyright notice,
-- this list of conditions and the following disclaimer.
--
-- Redistributions in synthesized form must reproduce the above copyright
-- notice, this list of conditions and the following disclaimer in the
-- documentation and/or other materials provided with the distribution.
--
-- Neither the name of the author nor the names of other contributors may
-- be used to endorse or promote products derived from this software without
-- specific prior written permission.
--
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
-- AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
-- THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
-- PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE
-- LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
-- CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
-- SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
-- INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
-- CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
-- ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
-- POSSIBILITY OF SUCH DAMAGE.
--
-- Please report bugs to the author, but before you do so, please
-- make sure that this is not a derivative work and that
-- you have the latest version of this file.
--
-- The latest version of this file can be found at:
--  http://www.opencores.org/cvsweb.shtml/t80/
--
-- Limitations :
--
-- File history :
--
--  0208 : First complete release
--
--  0211 : Fixed interrupt cycle
--
--  0235 : Updated for T80 interface change
--
--  0238 : Updated for T80 interface change
--
--  0240 : Updated for T80 interface change
--
--  0242 : Updated for T80 interface change
--
--  0247 : Fixed bus req/ack cycle
--
--  0247a: 7th of September, 2003 by Kazuhiro Tsujikawa (tujikawa@hat.hi-ho.ne.jp)
--         Fixed IORQ_n, RD_n, WR_n bus timing

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.T80_Pack.all;

entity T80a is
    generic(
        Mode : integer := 0 -- 0 => Z80, 1 => Fast Z80, 2 => 8080, 3 => GB
    );
    port(
        -- Additions
        TS          : out std_logic_vector(2 downto 0);
        Regs        : out std_logic_vector(255 downto 0);
        PdcData     : out std_logic_vector(7 downto 0);
        -- Original Signals
        RESET_n     : in std_logic;
        CLK_n       : in std_logic;
        CEN         : in std_logic;
        WAIT_n      : in std_logic;
        INT_n       : in std_logic;
        NMI_n       : in std_logic;
        BUSRQ_n     : in std_logic;
        M1_n        : out std_logic;
        MREQ_n      : out std_logic;
        IORQ_n      : out std_logic;
        RD_n        : out std_logic;
        WR_n        : out std_logic;
        RFSH_n      : out std_logic;
        HALT_n      : out std_logic;
        BUSAK_n     : out std_logic;
        A           : out std_logic_vector(15 downto 0);
        Din         : in std_logic_vector(7 downto 0);
        Dout        : out std_logic_vector(7 downto 0);
        Den         : out std_logic
    );
end T80a;

architecture rtl of T80a is

    signal Reset_s      : std_logic;
    signal IntCycle_n   : std_logic;
    signal NMICycle_n   : std_logic;
    signal IORQ         : std_logic;
    signal NoRead       : std_logic;
    signal Write        : std_logic;
    signal MREQ         : std_logic;
    signal MReq_Inhibit : std_logic;
    signal IReq_Inhibit : std_logic;			    -- 0247a
    signal Req_Inhibit  : std_logic;
    signal RD           : std_logic;
    signal MREQ_n_i     : std_logic;
    signal IORQ_n_i     : std_logic;
    signal RD_n_i       : std_logic;
    signal WR_n_i       : std_logic;
    signal WR_n_j       : std_logic;			    -- 0247a
    signal RFSH_n_i     : std_logic;
    signal BUSAK_n_i    : std_logic;
    signal A_i          : std_logic_vector(15 downto 0);
    signal DO           : std_logic_vector(7 downto 0);
    signal DI_Reg       : std_logic_vector (7 downto 0);    -- Input synchroniser
    signal Wait_s       : std_logic;
    signal MCycle       : std_logic_vector(2 downto 0);
    signal TState       : std_logic_vector(2 downto 0);
    signal HALT_n_int   : std_logic;
    signal iack1        : std_logic;
    signal iack2        : std_logic;

begin


    BUSAK_n <= BUSAK_n_i;
    MREQ_n_i <= not MREQ or (Req_Inhibit and MReq_Inhibit);
    RD_n_i <= not RD or (IORQ and IReq_Inhibit) or Req_Inhibit;  -- DMB
    WR_n_j <= WR_n_i or (IORQ and IReq_Inhibit);                 -- DMB
    HALT_n <= HALT_n_int;


    --Remove tristate as in ICE-Z80 this is implmeneted in Z80CpuMon
    --MREQ_n <= MREQ_n_i; when BUSAK_n_i = '1' else 'Z';
    --IORQ_n <= IORQ_n_i or IReq_Inhibit when BUSAK_n_i = '1' else 'Z';	-- 0247a
    --RD_n <= RD_n_i when BUSAK_n_i = '1' else 'Z';
    --WR_n <= WR_n_j when BUSAK_n_i = '1' else 'Z';			-- 0247a
    --RFSH_n <= RFSH_n_i when BUSAK_n_i = '1' else 'Z';
    --A <= A_i when BUSAK_n_i = '1' else (others => 'Z');

    MREQ_n <= MREQ_n_i;
    IORQ_n <= IORQ_n_i or IReq_Inhibit or Req_inhibit; --DMB
    RD_n <= RD_n_i;
    WR_n <= WR_n_j;			-- 0247a
    RFSH_n <= RFSH_n_i;
    A <= A_i;

    Dout <= DO;
    Den  <= Write and BUSAK_n_i;

    process (RESET_n, CLK_n)
    begin
        if RESET_n = '0' then
            Reset_s <= '0';
        elsif CLK_n'event and CLK_n = '1' then
            Reset_s <= '1';
        end if;
    end process;

    u0 : T80
        generic map(
            Mode => Mode,
            IOWait => 1)
        port map(
            CEN => CEN,
            M1_n => M1_n,
            IORQ => IORQ,
            NoRead => NoRead,
            Write => Write,
            RFSH_n => RFSH_n_i,
            HALT_n => HALT_n_int,
            WAIT_n => Wait_s,
            INT_n => INT_n,
            NMI_n => NMI_n,
            RESET_n => Reset_s,
            BUSRQ_n => BUSRQ_n,
            BUSAK_n => BUSAK_n_i,
            CLK_n => CLK_n,
            A => A_i,
            DInst => Din,
            DI => DI_Reg,
            DO => DO,
            MC => MCycle,
            TS => TState,
            IntCycle_n => IntCycle_n,
            NMICycle_n => NMICycle_n,
            REG => Regs(211 downto 0),
            DIRSet => '0',
            DIR => (others => '0')
            );

    Regs(255 downto 212) <= (others => '0');

    process (CLK_n)
    begin
        if CLK_n'event and CLK_n = '0' then
            if CEN = '1' then
                Wait_s <= WAIT_n or (IORQ_n_i and MREQ_n_i);
                if TState = "011" and BUSAK_n_i = '1' then
                    DI_Reg <= to_x01(Din);
                end if;
            end if;
        end if;
    end process;

    process (CLK_n)		-- 0247a
    begin
        if CLK_n'event and CLK_n = '1' then
            IReq_Inhibit <= (not IORQ) and IntCycle_n;
        end if;
    end process;

    process (Reset_s,CLK_n)	-- 0247a
    begin
        if Reset_s = '0' then
            WR_n_i <= '1';
        elsif CLK_n'event and CLK_n = '0' then
            if CEN = '1' then
                if (IORQ = '0') then
                    if TState = "010" then
                        WR_n_i <= not Write;
                    elsif Tstate = "011" then
                        WR_n_i <= '1';
                    end if;
                else
                    if TState = "001" then     -- DMB
                        WR_n_i <= not Write;
                    elsif Tstate = "011" then
                        WR_n_i <= '1';
                    end if;
                end if;
            end if;
        end if;
    end process;

    process (Reset_s,CLK_n)	-- 0247a
    begin
        if Reset_s = '0' then
            Req_Inhibit <= '0';
        elsif CLK_n'event and CLK_n = '1' then
            if CEN = '1' then
                if MCycle = "001" and TState = "010" and wait_s = '1' then
                    Req_Inhibit <= '1';
                else
                    Req_Inhibit <= '0';
                end if;
            end if;
        end if;
    end process;

    process (Reset_s,CLK_n)
    begin
        if Reset_s = '0' then
            MReq_Inhibit <= '0';
        elsif CLK_n'event and CLK_n = '0' then
            if CEN = '1' then
                if MCycle = "001" and TState = "010" then
                    MReq_Inhibit <= '1';
                else
                    MReq_Inhibit <= '0';
                end if;
            end if;
        end if;
    end process;

    process(Reset_s,CLK_n)	-- 0247a
    begin
        if Reset_s = '0' then
            RD <= '0';
            IORQ_n_i <= '1';
            MREQ <= '0';
            iack1 <= '0';
            iack2 <= '0';
        elsif CLK_n'event and CLK_n = '0' then
            if CEN = '1' then
                if MCycle = "001" then
                    if IntCycle_n = '1' then
                        -- Normal M1 Cycle
                        if TState = "001" then
                            RD <= '1';
                            MREQ <= '1';
                            IORQ_n_i <= '1';
                        end if;
                    else
                        -- Interupt Ack Cycle
                        -- 5 T-states: T1 T1 (auto wait) T1 (auto wait) T2 T3
                        -- Assert IORQ in middle of third T1
                        if TState = "001" then
                            iack1 <= '1';
                            iack2 <= iack1;
                        else
                            iack1 <= '0';
                            iack2 <= '0';
                        end if;
                        if iack2 = '1' then
                            IORQ_n_i <= '0';
                        end if;
                    end if;
                    if TState = "011" then
                        RD <= '0';
                        IORQ_n_i <= '1';
                        MREQ <= '1';
                    end if;
                    if TState = "100" then
                        MREQ <= '0';
                    end if;
                else
                    if TState = "001" and NoRead = '0' then
                        IORQ_n_i <= not IORQ;
                        MREQ <= not IORQ;
                        RD <= not Write;    -- DMB
                    end if;
                    if TState = "011" then
                        RD <= '0';
                        IORQ_n_i <= '1';
                        MREQ <= '0';
                    end if;
                end if;
            end if;
        end if;
    end process;

    TS <= TState;

    PdcData <= (not HALT_n_int) & (not NMICycle_n) & (not IntCycle_n) & "00000";

end;
