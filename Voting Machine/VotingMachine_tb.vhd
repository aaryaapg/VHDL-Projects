--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:27:57 05/07/2020
-- Design Name:   
-- Module Name:   E:/FPGA/Xilinx ISE Projects/VotingMachine/VotingMachine_tb.vhd
-- Project Name:  VotingMachine
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: VotingMachine
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY VotingMachine_tb IS
END VotingMachine_tb;
 
ARCHITECTURE behavior OF VotingMachine_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT VotingMachine
    PORT(
         Reset : IN  std_logic;
         Clk : IN  std_logic;
         Party1_Sel : IN  std_logic;
         Party2_Sel : IN  std_logic;
         Party3_Sel : IN  std_logic;
         OK : IN  std_logic;
         Count1_final : OUT  std_logic_vector(5 downto 0);
         Count2_final : OUT  std_logic_vector(5 downto 0);
         Count3_final : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Reset : std_logic := '0';
   signal Clk : std_logic := '0';
   signal Party1_Sel : std_logic := '0';
   signal Party2_Sel : std_logic := '0';
   signal Party3_Sel : std_logic := '0';
   signal OK : std_logic := '0';

 	--Outputs
   signal Count1_final : std_logic_vector(5 downto 0);
   signal Count2_final : std_logic_vector(5 downto 0);
   signal Count3_final : std_logic_vector(5 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 5 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: VotingMachine PORT MAP (
          Reset => Reset,
          Clk => Clk,
          Party1_Sel => Party1_Sel,
          Party2_Sel => Party2_Sel,
          Party3_Sel => Party3_Sel,
          OK => OK,
          Count1_final => Count1_final,
          Count2_final => Count2_final,
          Count3_final => Count3_final
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for Clk_period*10;

      -- insert stimulus here 
		Reset <= '1';
		wait for 10 ns;
		Reset <= '0';
		
		Party1_Sel <= '0';
		Party2_Sel <= '0';
		Party3_Sel <= '0';
		
		Party1_Sel <= '1'; -- 1 vote for Party1
		wait for 10 ns;
		Party1_Sel <= '0'; -- A push button should go HIGH, then LOW
		wait for 10 ns;
		OK <= '1';
		wait for 10 ns;
		OK <= '0';
		wait for 10 ns;
		
		Party1_Sel <= '1'; -- 1 vote for Party1
		wait for 10 ns;
		Party1_Sel <= '0';
		wait for 10 ns;
		OK <= '1';
		wait for 10 ns;
		OK <= '0';
		wait for 10 ns;
		
		Party1_Sel <= '1'; -- 1 vote for Party1
		wait for 10 ns;
		Party1_Sel <= '0';
		wait for 10 ns;
		OK <= '1';
		wait for 10 ns;
		OK <= '0';
		wait for 10 ns;
		
		Party2_Sel <= '1'; -- 1 vote for Party2
		wait for 10 ns;
		Party2_Sel <= '0';
		wait for 10 ns;
		OK <= '1';
		wait for 10 ns;
		OK <= '0';
		wait for 10 ns;
		
		Party2_Sel <= '1'; -- 1 vote for Party2
		wait for 10 ns;
		Party2_Sel <= '0';
		wait for 10 ns;
		OK <= '1';
		wait for 10 ns;
		OK <= '0';
		wait for 10 ns;
		
		Party3_Sel <= '1'; -- 1 vote for Party3
		wait for 10 ns;
		Party3_Sel <= '0';
		wait for 10 ns;
		OK <= '1';
		wait for 10 ns;
		OK <= '0';
		wait for 10 ns;
		
      wait;
   end process;

END;
