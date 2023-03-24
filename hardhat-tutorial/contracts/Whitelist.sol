//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Whitelist {
    // 允许白名单地址的最大数量
    uint8 public maxWhitelistedAddresses;

    // 创建一个白名单地址的映射
    // 如果地址在白名单中，则返回TRUE，否则返回false
    mapping(address => bool) public whitelistedAddresses;

    // 当前已经申请过的白名单地址数量
    uint8 public numAddressesWhitelisted;
  
    // 构造函数，在部署时传入允许白名单地址的最大数量
    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses =  _maxWhitelistedAddresses;
    }

    /**
        这个函数将调用者的sender添加到白名单当中
     */
    function addAddressToWhitelist() public {
        // 判断当前用户是否已经在白名单中
        require(!whitelistedAddresses[msg.sender], "Sender has already been whitelisted");
        // 如果白名单用户数量超出阈值，则抛出异常
        require(numAddressesWhitelisted < maxWhitelistedAddresses, "More addresses cant be added, limit reached");
        // 将该地址设置为true
        whitelistedAddresses[msg.sender] = true;
        // 当前白名单地址数量+1
        numAddressesWhitelisted += 1;
    }
}