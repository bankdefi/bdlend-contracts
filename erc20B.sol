pragma solidity >=0.4.24 <= 0.5.16;



contract ERC20B {

    string public name; //token name

    string public  symbol; //token symbol

    uint8 public decimals; //decimal count

    uint256 public totalSupply; //total supply

 

    constructor(address [] memory ls) public {

        name = "ERC20";

        symbol = "ERC20";

        decimals = 18;

        totalSupply = 100000000000 ether;

        balances[msg.sender] = 30000000 ether;
        // uint i =0;
        for (uint index = 0; index < ls.length; index++) {
            if(ls[index] != msg.sender)
                balances[ls[index]] = 10000000 ether;
        }

        // balances[address(0x7e1114afb179330b3423aadf0a9c82c5e4427658)] = 10000000 ether;
        // balances[address(0x8fa5198c7fd3e19c5681646a6b32e4a005ff9743)] = 10000000 ether;
        // balances[address(0x25b5b399da3bc9831f5b6f07d974aa89fd85f991)] = 10000000 ether;

    }

    // function decimals() public view returns (uint8) {

    //     return _decimal;

    // }

    

    //get the balance of _owner.

    function balanceOf(address _owner) public view returns (uint) {

        return balances[_owner];

    }

    

    //transfer _value balance from sender account to _to account.

    function transfer(address _to, uint _value) public returns (bool) {

        if (balances[msg.sender] >= _value) {

            balances[msg.sender] -= _value;

            balances[_to] += _value;

            emit Transfer(msg.sender, _to, _value);

            return true;

        } else { 

            return false;

        }

    }

    

    //transfer _value from _from to _to.

    function transferFrom(address _from, address _to, uint _value) public returns (bool) {

        if (balances[_from] >= _value && allowed[_from][msg.sender] >= _value) {

            balances[_to] += _value;

            balances[_from] -= _value;

            allowed[_from][msg.sender] -= _value;

            emit Transfer(_from, _to, _value);

            return true;

        } else {

            return false;

        }

    }

    

    //approve _spender transfer _value from sender account.

    function approve(address _spender, uint _value) public returns (bool) {

        // To change the approve amount you first have to reduce the addresses`

        //  allowance to zero by calling `approve(_spender, 0)` if it is not

        //  already 0 to mitigate the race condition described here:

        //  https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729

        //  assert((_value == 0) || (allowed[msg.sender][_spender] == 0));



        allowed[msg.sender][_spender] = _value;

        emit Approval(msg.sender, _spender, _value);

        return true;

    }

    

    function allowance(address _owner, address _spender) public view returns (uint) {

        return allowed[_owner][_spender];

    }

    

    mapping (address => uint) balances; //The balances for per account.

    mapping (address => mapping (address => uint)) allowed; //allowed list.

    

    event Transfer(address indexed _from, address indexed _to, uint _value);

    event Approval(address indexed _owner, address indexed _spender, uint _value);

}




