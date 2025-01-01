----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:08:48 05/18/2020 
-- Design Name: 
-- Module Name:    DecadeCounter - Behavioral 
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
use IEEE.STD_LOGIC_unsigned.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DecadeCounter is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           clk_out : out  STD_LOGIC);
end DecadeCounter;

architecture Behavioral of DecadeCounter is
signal divider : std_logic_vector(3 downto 0);
begin
process(clk,rst)
begin
	if (rst = '1') then --Asynchronous clock 
	divider <="0000";
	else
		if rising_edge(clk) then
		divider <= divider + '1';
		end if;
	end if;
end process;
clk_out <= divider(3); -- clk_out = clk divided by 16
end Behavioral;

