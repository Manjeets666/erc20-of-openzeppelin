pragma solidity ^0.5.0;
// ERC Token Standard #20 Interface

contract Token  {
    string public name;
    address public owner; 
    string public symbol;
    uint8 public decimals; // by default 18

    uint256 public _totalSupply;

    mapping(address => uint) balances;
    mapping(address => mapping(address => uint)) allowed;
    
    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);

    // Initializes contract with initial supply tokens to the creator of the contract.
    
    constructor() public {
        owner=msg.sender;
        name = "Manjeet";
        symbol = "MS";
        decimals = 18;
        _totalSupply = 100000000000000000000000000;

        balances[msg.sender] = _totalSupply;
        emit Transfer(address(0), msg.sender, _totalSupply);
    }

    function totalSupply() public view returns (uint) {
        return _totalSupply;
    }

    function balanceOf(address tokenOwner) public view returns (uint ) {
        return balances[tokenOwner];
    }

    function allowance(address tokenOwner, address spender) public view returns (uint remaining) {
        return allowed[tokenOwner][spender];
    }

    function approve(address spender, uint tokens) public returns (bool success) {
        allowed[msg.sender][spender] = tokens;
        emit Approval(msg.sender, spender, tokens);
        return true;
    }

    function transfer(address to, uint tokens) public returns (bool success) {
        require(balances[msg.sender]>=tokens);
        balances[msg.sender]-= tokens;
        balances[to]+= tokens;
        emit Transfer(msg.sender, to, tokens);
        return true;
    }

    function transferFrom(address from, address to, uint tokens) public returns (bool success) {
        require(tokens<= balances[from]);
        require(tokens<=allowed[from][msg.sender]); 
        balances[from]-= tokens;
        allowed[from][msg.sender]-= tokens;
        balances[to]+= tokens;
        emit Transfer(from, to, tokens);
        return true;
    }
    function mint(address tokenOwner, uint mintedTokens) public {
        require(msg.sender==owner);
        balances[tokenOwner]+=mintedTokens;
        _totalSupply+=mintedTokens;
        emit Transfer(address(0),tokenOwner,mintedTokens);
    } 
    function burn(address account, uint tokens) public returns (bool success){
        require(account != address(0), "ERC20: burn from the zero address");
        require(balances[msg.sender]>=tokens);
        balances[account]-=tokens;
        _totalSupply-=tokens;
        emit Transfer(account,address(0),tokens);
        return true;
        
    }
    
}
