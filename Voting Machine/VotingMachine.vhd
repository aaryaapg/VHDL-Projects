----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Aaryaa Padhyegurjar
-- 
-- Create Date:    16:32:04 05/07/2020 
-- Design Name: 
-- Module Name:    VotingMachine - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL; --to use + operator
use IEEE.STD_LOGIC_unsigned.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity VotingMachine is
    Port ( Reset : in  STD_LOGIC; --Active High Reset
			  Clk : in STD_LOGIC;
           Party1_Sel : in  STD_LOGIC;
           Party2_Sel : in  STD_LOGIC;
           Party3_Sel : in  STD_LOGIC;
           OK : in  STD_LOGIC;
           Count1_final : out  STD_LOGIC_VECTOR(5 downto 0);
           Count2_final  : out  STD_LOGIC_VECTOR(5 downto 0);
           Count3_final  : out  STD_LOGIC_VECTOR(5 downto 0));
end VotingMachine;

architecture Behavioral of VotingMachine is
signal c1,c2,c3 : STD_LOGIC_VECTOR(5 downto 0);
constant Initial : STD_LOGIC_VECTOR(5 downto 0) := "000001";
constant Check : STD_LOGIC_VECTOR(5 downto 0) := "000010";
constant Party1 : STD_LOGIC_VECTOR(5 downto 0) := "000100";
constant Party2 : STD_LOGIC_VECTOR(5 downto 0) := "001000";
constant Party3 : STD_LOGIC_VECTOR(5 downto 0) := "010000";
constant Done : STD_LOGIC_VECTOR(5 downto 0) := "100000";
signal state : STD_LOGIC_VECTOR(5 downto 0) := "000001";
begin
process(Clk, Reset, Party1_Sel, Party2_Sel, Party3_Sel)
-- Asynchronous Reset
begin
	if( Reset = '1') then 
		c1 <= "000000";
		c2 <= "000000";
		c3 <= (others => '0'); --A nice way of initializing all bus i/ps to 0
	else
		if(Clk'event and Clk = '1' and Reset = '0') then -- positive edge triggered clock
			case state is 
				when Initial => --No OFL
					if(Party1_Sel='1' or Party2_Sel='1' or Party3_Sel='1') then --NSL
						state <= Check;
					else
						state <= Initial;
					end if;
				when Check => --No OFL
					if(Party1_Sel='1') then state <= Party1; --NSL
					elsif(Party2_Sel='1') then state <= Party2;
					elsif(Party3_Sel='1') then state <= Party3;
					else state <= Check;
					end if;
				when Party1 => 
					if(OK = '1') then
					c1 <= c1 + 1; --OFL
					end if;
					if(OK<='1') then state <= Done; --NSL
					else state <= Party1;
					end if;
				when Party2 => 
					if(OK = '1') then
					c2 <= c2 + 1; --OFL
					end if;
					if(OK<='1') then state <= Done; --NSL
					else state <= Party2;
					end if;
				when Party3 => 
					if(OK = '1') then
					c3 <= c3 + 1; --OFL
					end if;
					if(OK<='1') then state <= Done; --NSL
					else state <= Party3;
					end if;
				when Done => --No OFL
					state<= Initial;
				when others =>
					state<= Initial;
			end case;
		end if;
	end if;
end process;
Count1_final <= c1;
Count2_final <= c2;
Count3_final <= c3;
end Behavioral;

