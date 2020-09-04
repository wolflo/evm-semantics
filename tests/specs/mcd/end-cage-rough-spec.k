requires "verification.k"

module END-CAGE-ROUGH-SPEC
  imports VERIFICATION

// End_cage-surplus
rule [End.cage-surplus.pass.rough]:
  <k> #execute ~> CONTINUATION => #halt ~> CONTINUATION </k>
  <exit-code> 1 </exit-code>
  <mode> NORMAL </mode>
  <schedule> ISTANBUL </schedule>
  <ethereum>
    <evm>
      <output> .ByteArray </output>
      <statusCode> _ => EVMC_SUCCESS </statusCode>
      <endPC> _ => ?_ </endPC>
      <callStack> _VCallStack </callStack>
      <interimStates> _ </interimStates>
      <touchedAccounts> _ => ?_ </touchedAccounts>
      <callState>
        <program> End_bin_runtime </program>
        <jumpDests> #computeValidJumpDests(End_bin_runtime) </jumpDests>
        <id> ACCT_ID </id>
        <caller> CALLER_ID </caller>
        <callData> #abiCallData("cage", .TypedArgs) ++ CD => ?_ </callData>
        <callValue> VCallValue </callValue>
        <wordStack> .WordStack => ?_ </wordStack>
        <localMem> .Memory => ?_ </localMem>
        <pc> 0 => ?_ </pc>
        <gas> VGas => ?_ </gas>
        <memoryUsed> 0 => ?_ </memoryUsed>
        <callGas> _ => ?_ </callGas>
        <static> false </static>
        <callDepth> VCallDepth </callDepth>
      </callState>
      <substate>
        <selfDestruct> _VSelfDestruct </selfDestruct>
        <log> _ => ?_ </log>
        <refund> _ => ?_ </refund>
      </substate>
      <gasPrice> _ </gasPrice>
      <origin> ORIGIN_ID </origin>
      <blockhashes> _ </blockhashes>
      <block>
        <previousHash> _ </previousHash>
        <ommersHash> _ </ommersHash>
        <coinbase> _ </coinbase>
        <stateRoot> _ </stateRoot>
        <transactionsRoot> _ </transactionsRoot>
        <receiptsRoot> _ </receiptsRoot>
        <logsBloom> _ </logsBloom>
        <difficulty> _ </difficulty>
        <number> _BLOCK_NUMBER </number>
        <gasLimit> _ </gasLimit>
        <gasUsed> _ </gasUsed>
        <timestamp> TIME </timestamp>
        <extraData> _ </extraData>
        <mixHash> _ </mixHash>
        <blockNonce> _ </blockNonce>
        <ommerBlockHeaders> _ </ommerBlockHeaders>
      </block>
    </evm>
    <network>
      <chainID> VChainId </chainID>
      <activeAccounts> SetItem(ACCT_ID)
      SetItem(Vat)
      SetItem(Cat)
      SetItem(Vow)
      SetItem(Flapper)
      SetItem(Flopper)
      SetItem(Spotter)
      SetItem(Pot)
      SetItem(1)
      SetItem(2)
      SetItem(3)
      SetItem(4)
      SetItem(5)
      SetItem(6)
      SetItem(7)
      SetItem(8)
      SetItem(9) _ </activeAccounts>
      <accounts>
        <account>
          <acctID> ACCT_ID </acctID>
          <balance> ACCT_ID_balance </balance>
          <code> End_bin_runtime </code>
          <storage>
           .Map
          [#End.wards[CALLER_ID] <- (CallerMay) => CallerMay]
          [#End.live <- (Live) => 0]
          [#End.when <- (When) => TIME]
          [#End.vat <- (Vat) => Vat]
          [#End.cat <- (Cat) => Cat]
          [#End.vow <- (Vow) => Vow]
            _:Map
           </storage>
          <origStorage>
           .Map
          [#End.wards[CALLER_ID] <- (Junk_0)]
          [#End.live <- (Junk_1)]
          [#End.when <- (Junk_2)]
          [#End.vat <- (Junk_3)]
          [#End.cat <- (Junk_4)]
          [#End.vow <- (Junk_5)]
            _:Map
           </origStorage>
          <nonce> _Nonce_End => ?_ </nonce>
        </account>
        <account>
          <acctID> Vat </acctID>
          <balance> Vat_balance </balance>
          <code> Vat_bin_runtime </code>
          <storage>
           .Map
          [#Vat.wards[ACCT_ID] <- (EndMayVat) => EndMayVat]
          [#Vat.live <- (VatLive) => 0]
          [#Vat.dai[Flapper] <- (Dai_f) => 0]
          [#Vat.dai[Vow] <- (Dai_v) => (Dai_v +Int Dai_f) -Int Sin_v]
          [#Vat.sin[Vow] <- (Sin_v) => 0]
          [#Vat.debt <- (Debt) => Debt -Int Sin_v]
          [#Vat.vice <- (Vice) => Vice -Int Sin_v]
          [#Vat.can[Flapper][Flapper] <- (Junk_6) => ?_]
            _:Map
           </storage>
          <origStorage>
           .Map
          [#Vat.wards[ACCT_ID] <- (Junk_7)]
          [#Vat.live <- (Junk_8)]
          [#Vat.dai[Flapper] <- (Junk_9)]
          [#Vat.dai[Vow] <- (Junk_10)]
          [#Vat.sin[Vow] <- (Junk_11)]
          [#Vat.debt <- (Junk_12)]
          [#Vat.vice <- (Junk_13)]
          [#Vat.can[Flapper][Flapper] <- (Junk_14)]
            _:Map
           </origStorage>
          <nonce> _Nonce_Vat => ?_ </nonce>
        </account>
        <account>
          <acctID> Cat </acctID>
          <balance> Cat_balance </balance>
          <code> Cat_bin_runtime </code>
          <storage>
           .Map
          [#Cat.live <- (CatLive) => 0]
          [#Cat.wards[ACCT_ID] <- (EndMayCat) => EndMayCat]
            _:Map
           </storage>
          <origStorage>
           .Map
          [#Cat.live <- (Junk_15)]
          [#Cat.wards[ACCT_ID] <- (Junk_16)]
            _:Map
           </origStorage>
          <nonce> _Nonce_Cat => ?_ </nonce>
        </account>
        <account>
          <acctID> Vow </acctID>
          <balance> Vow_balance </balance>
          <code> Vow_bin_runtime </code>
          <storage>
           .Map
          [#Vow.wards[ACCT_ID] <- (EndMayVow) => EndMayVow]
          [#Vow.vat <- (VowVat) => VowVat]
          [#Vow.flapper <- (Flapper) => Flapper]
          [#Vow.flopper <- (Flopper) => Flopper]
          [#Vow.live <- (VowLive) => 0]
          [#Vow.Sin <- (Sin) => 0]
          [#Vow.Ash <- (Ash) => 0]
            _:Map
           </storage>
          <origStorage>
           .Map
          [#Vow.wards[ACCT_ID] <- (Junk_17)]
          [#Vow.vat <- (Junk_18)]
          [#Vow.flapper <- (Junk_19)]
          [#Vow.flopper <- (Junk_20)]
          [#Vow.live <- (Junk_21)]
          [#Vow.Sin <- (Junk_22)]
          [#Vow.Ash <- (Junk_23)]
            _:Map
           </origStorage>
          <nonce> Nonce_Vow => ?_ </nonce>
        </account>
        <account>
          <acctID> Flapper </acctID>
          <balance> Flapper_balance </balance>
          <code> Flapper_bin_runtime </code>
          <storage>
           .Map
          [#Flapper.wards[Vow] <- (VowMayFlap) => VowMayFlap]
          [#Flapper.vat <- (FlapVat) => FlapVat]
          [#Flapper.live <- (FlapLive) => 0]
            _:Map
           </storage>
          <origStorage>
           .Map
          [#Flapper.wards[Vow] <- (Junk_24)]
          [#Flapper.vat <- (Junk_25)]
          [#Flapper.live <- (Junk_26)]
            _:Map
           </origStorage>
          <nonce> Nonce_Flapper => ?_ </nonce>
        </account>
        <account>
          <acctID> Flopper </acctID>
          <balance> Flopper_balance </balance>
          <code> Flopper_bin_runtime </code>
          <storage>
           .Map
          [#Flopper.wards[Vow] <- (VowMayFlop) => VowMayFlop]
          [#Flopper.live <- (FlopLive) => 0]
          [#Flopper.vow <- (FlopVow) => Vow]
            _:Map
           </storage>
          <origStorage>
           .Map
          [#Flopper.wards[Vow] <- (Junk_27)]
          [#Flopper.live <- (Junk_28)]
          [#Flopper.vow <- (Junk_29)]
            _:Map
           </origStorage>
          <nonce> _Nonce_Flopper => ?_ </nonce>
        </account>
        <account>
          <acctID> Spotter </acctID>
          <balance> Spotter_balance </balance>
          <code> Spotter_bin_runtime </code>
          <storage>
           .Map
          [#Spotter.wards[ACCT_ID] <- (EndMaySpot) => EndMaySpot]
          [#Spotter.live <- (Junk_30) => 0]
            _:Map
           </storage>
          <origStorage>
           .Map
          [#Spotter.wards[ACCT_ID] <- (Junk_31)]
          [#Spotter.live <- (Junk_32)]
            _:Map
           </origStorage>
          <nonce> Nonce_Spotter => ?_ </nonce>
        </account>
        <account>
          <acctID> Pot </acctID>
          <balance> Pot_balance </balance>
          <code> Pot_bin_runtime </code>
          <storage>
           .Map
          [#Pot.wards[ACCT_ID] <- (EndMayPot) => EndMayPot]
          [#Pot.dsr <- (Dsr) => #Ray]
          [#Pot.live <- (PotLive) => 0]
            _:Map
           </storage>
          <origStorage>
           .Map
          [#Pot.wards[ACCT_ID] <- (Junk_33)]
          [#Pot.dsr <- (Junk_34)]
          [#Pot.live <- (Junk_35)]
            _:Map
           </origStorage>
          <nonce> Nonce_Pot => ?_ </nonce>
        </account>
        <account>
          <acctID> 1 </acctID>
          <balance> ECREC_BAL </balance>
          <code> .ByteArray </code>
          <storage> _:Map </storage>
          <origStorage> _ </origStorage>
          <nonce> _ </nonce>
        </account>
        <account>
          <acctID> 2 </acctID>
          <balance> SHA256_BAL </balance>
          <code> .ByteArray </code>
          <storage> _:Map </storage>
          <origStorage> _ </origStorage>
          <nonce> _ </nonce>
        </account>
        <account>
          <acctID> 3 </acctID>
          <balance> RIP160_BAL </balance>
          <code> .ByteArray </code>
          <storage> _:Map </storage>
          <origStorage> _ </origStorage>
          <nonce> _ </nonce>
        </account>
        <account>
          <acctID> 4 </acctID>
          <balance> ID_BAL </balance>
          <code> .ByteArray </code>
          <storage> _:Map </storage>
          <origStorage> _ </origStorage>
          <nonce> _ </nonce>
        </account>
        <account>
          <acctID> 5 </acctID>
          <balance> MODEXP_BAL </balance>
          <code> .ByteArray </code>
          <storage> _:Map </storage>
          <origStorage> _ </origStorage>
          <nonce> _ </nonce>
        </account>
        <account>
          <acctID> 6 </acctID>
          <balance> ECADD_BAL </balance>
          <code> .ByteArray </code>
          <storage> _:Map </storage>
          <origStorage> _ </origStorage>
          <nonce> _ </nonce>
        </account>
        <account>
          <acctID> 7 </acctID>
          <balance> ECMUL_BAL </balance>
          <code> .ByteArray </code>
          <storage> _:Map </storage>
          <origStorage> _ </origStorage>
          <nonce> _ </nonce>
        </account>
        <account>
          <acctID> 8 </acctID>
          <balance> ECPAIRING_BAL </balance>
          <code> .ByteArray </code>
          <storage> _:Map </storage>
          <origStorage> _ </origStorage>
          <nonce> _ </nonce>
        </account>
        <account>
          <acctID> 9 </acctID>
          <balance> BLAKE2_BAL </balance>
          <code> .ByteArray </code>
          <storage> _:Map </storage>
          <origStorage> _ </origStorage>
          <nonce> _ </nonce>
        </account>
       ...
      </accounts>
      <txOrder> _ </txOrder>
      <txPending> _ </txPending>
      <messages> _ </messages>
    </network>
  </ethereum>
requires #rangeAddress(ACCT_ID)
andBool ACCT_ID =/=Int 0
andBool #notPrecompileAddress(ACCT_ID)
andBool #rangeAddress(CALLER_ID)
andBool #rangeAddress(ORIGIN_ID)
andBool #rangeUInt(256, TIME)
andBool #rangeUInt(256, ACCT_ID_balance)
andBool #rangeUInt(256, ECREC_BAL)
andBool #rangeUInt(256, SHA256_BAL)
andBool #rangeUInt(256, RIP160_BAL)
andBool #rangeUInt(256, ID_BAL)
andBool #rangeUInt(256, MODEXP_BAL)
andBool #rangeUInt(256, ECADD_BAL)
andBool #rangeUInt(256, ECMUL_BAL)
andBool #rangeUInt(256, ECPAIRING_BAL)
andBool #rangeUInt(256, BLAKE2_BAL)
andBool VCallDepth <=Int 1024
andBool #rangeUInt(256, VCallValue)
andBool #rangeUInt(256, VChainId)

  andBool (#rangeAddress(Vat)
  andBool (#rangeAddress(Cat)
  andBool (#rangeAddress(Vow)
  andBool (#rangeAddress(Spotter)
  andBool (#rangeAddress(Pot)
  andBool (#rangeAddress(Flapper)
  andBool (#rangeAddress(Flopper)
  andBool (#rangeAddress(FlapVat)
  andBool (#rangeAddress(VowVat)
  andBool (#rangeUInt(256, Live)
  andBool (#rangeUInt(256, When)
  andBool (#rangeUInt(256, VatLive)
  andBool (#rangeUInt(256, CatLive)
  andBool (#rangeUInt(256, VowLive)
  andBool (#rangeUInt(256, PotLive)
  andBool (#rangeUInt(256, FlapLive)
  andBool (#rangeUInt(256, FlopLive)
  andBool (#rangeUInt(256, FlopVow)
  andBool (#rangeUInt(256, CallerMay)
  andBool (#rangeUInt(256, EndMayVat)
  andBool (#rangeUInt(256, EndMayCat)
  andBool (#rangeUInt(256, EndMayVow)
  andBool (#rangeUInt(256, EndMaySpot)
  andBool (#rangeUInt(256, EndMayPot)
  andBool (#rangeUInt(256, VowMayFlap)
  andBool (#rangeUInt(256, VowMayFlop)
  andBool (#rangeUInt(256, Dai_f)
  andBool (#rangeUInt(256, Sin_v)
  andBool (#rangeUInt(256, Dai_v)
  andBool (#rangeUInt(256, Debt)
  andBool (#rangeUInt(256, Vice)
  andBool (#rangeUInt(256, Sin)
  andBool (#rangeUInt(256, Ash)
  andBool (#rangeUInt(256, Dsr)
  andBool (#rangeUInt(256, Vat_balance)
  andBool (#rangeUInt(256, Cat_balance)
  andBool (#rangeUInt(256, Vow_balance)
  andBool (#rangeUInt(256, Flapper_balance)
  andBool (#rangeUInt(256, Flopper_balance)
  andBool (#rangeUInt(256, Spotter_balance)
  andBool (#rangeUInt(256, Pot_balance)
  andBool ((#sizeByteArray(CD) <=Int 1250000000)
  andBool ((#notPrecompileAddress(Vat))
  andBool ((#notPrecompileAddress(Cat))
  andBool ((#notPrecompileAddress(Vow))
  andBool ((#notPrecompileAddress(Spotter))
  andBool ((#notPrecompileAddress(Pot))
  andBool ((#notPrecompileAddress(Flapper))
  andBool ((#notPrecompileAddress(Flopper))
  andBool ((#notPrecompileAddress(FlapVat))
  andBool ((#notPrecompileAddress(VowVat))
  andBool ((ACCT_ID =/=Int Vat)
  andBool ((ACCT_ID =/=Int Cat)
  andBool ((ACCT_ID =/=Int Vow)
  andBool ((ACCT_ID =/=Int Flapper)
  andBool ((ACCT_ID =/=Int Flopper)
  andBool ((ACCT_ID =/=Int Spotter)
  andBool ((ACCT_ID =/=Int Pot)
  andBool ((Dai_v +Int Dai_f >Int Sin_v)
  andBool ((Flapper =/=Int Vow)
  andBool ((Flapper =/=Int Vat)
  andBool ((Flopper =/=Int Vow)
  andBool ((Flopper =/=Int Vat)
  andBool ((Flopper =/=Int Flapper)
  andBool ((FlapVat ==Int Vat)
  andBool ((VowVat  ==Int Vat)
  andBool ((VowVat  =/=Int Vow)
  andBool ((FlapVat =/=Int Vow)
  andBool ((Vat =/=Int 0)
  andBool ((Cat =/=Int 0)
  andBool ((Vow =/=Int 0)
  andBool ((Spotter =/=Int 0)
  andBool ((Pot =/=Int 0)
  andBool (VGas >=Int 3000000
  andBool (#rangeUInt(256, Junk_0)
  andBool (#rangeUInt(256, Junk_1)
  andBool (#rangeUInt(256, Junk_2)
  andBool (#rangeUInt(256, Junk_3)
  andBool (#rangeUInt(256, Junk_4)
  andBool (#rangeUInt(256, Junk_5)
  andBool (#rangeUInt(256, Junk_6)
  andBool (#rangeUInt(256, Junk_7)
  andBool (#rangeUInt(256, Junk_8)
  andBool (#rangeUInt(256, Junk_9)
  andBool (#rangeUInt(256, Junk_10)
  andBool (#rangeUInt(256, Junk_11)
  andBool (#rangeUInt(256, Junk_12)
  andBool (#rangeUInt(256, Junk_13)
  andBool (#rangeUInt(256, Junk_14)
  andBool (#rangeUInt(256, Junk_15)
  andBool (#rangeUInt(256, Junk_16)
  andBool (#rangeUInt(256, Junk_17)
  andBool (#rangeUInt(256, Junk_18)
  andBool (#rangeUInt(256, Junk_19)
  andBool (#rangeUInt(256, Junk_20)
  andBool (#rangeUInt(256, Junk_21)
  andBool (#rangeUInt(256, Junk_22)
  andBool (#rangeUInt(256, Junk_23)
  andBool (#rangeUInt(256, Junk_24)
  andBool (#rangeUInt(256, Junk_25)
  andBool (#rangeUInt(256, Junk_26)
  andBool (#rangeUInt(256, Junk_27)
  andBool (#rangeUInt(256, Junk_28)
  andBool (#rangeUInt(256, Junk_29)
  andBool (#rangeUInt(256, Junk_30)
  andBool (#rangeUInt(256, Junk_31)
  andBool (#rangeUInt(256, Junk_32)
  andBool (#rangeUInt(256, Junk_33)
  andBool (#rangeUInt(256, Junk_34)
  andBool (#rangeUInt(256, Junk_35)
  andBool (((VCallValue ==Int 0))
  andBool (((VCallDepth <Int 1022))
  andBool (((Live ==Int 1))
  andBool (((VowLive ==Int 1))
  andBool (((CallerMay ==Int 1))
  andBool (((EndMayVat ==Int 1))
  andBool (((EndMayCat ==Int 1))
  andBool (((EndMayVow ==Int 1))
  andBool (((VowMayFlap ==Int 1))
  andBool (((VowMayFlop ==Int 1))
  andBool (((EndMaySpot ==Int 1))
  andBool (((EndMayPot ==Int 1))
  andBool ((#rangeUInt(256, Dai_v +Int Dai_f))
  andBool ((#rangeUInt(256, Debt -Int Sin_v))
  andBool ((#rangeUInt(256, Vice -Int Sin_v)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

// Vat_cage
rule [Vat.cage.pass]:
  <k> #execute ~> CONTINUATION => #halt ~> CONTINUATION </k>
  <exit-code> 1 </exit-code>
  <mode> NORMAL </mode>
  <schedule> ISTANBUL </schedule>
  <ethereum>
    <evm>
      <output> .ByteArray </output>
      <statusCode> _ => EVMC_SUCCESS </statusCode>
      <endPC> _ => ?_ </endPC>
      <callStack> _VCallStack </callStack>
      <interimStates> _ </interimStates>
      <touchedAccounts> _ => ?_ </touchedAccounts>
      <callState>
        <program> Vat_bin_runtime </program>
        <jumpDests> #computeValidJumpDests(Vat_bin_runtime) </jumpDests>
        <id> ACCT_ID </id>
        <caller> CALLER_ID </caller>
        <callData> #abiCallData("cage", .TypedArgs) ++ CD => ?_ </callData>
        <callValue> VCallValue </callValue>
        <wordStack> .WordStack => ?_ </wordStack>
        <localMem> .Memory => ?_ </localMem>
        <pc> 0 => ?_ </pc>
        <gas> VGas => VGas -Int ((#if ( ( Lives ==K 0 ) orBool (notBool ( Junk_1 ==K Lives ) ) ) #then 0 #else 4200 #fi) +Int 6245) </gas>
        <memoryUsed> 0 => ?_ </memoryUsed>
        <callGas> _ => ?_ </callGas>
        <static> false </static>
        <callDepth> VCallDepth </callDepth>
      </callState>
      <substate>
        <selfDestruct> _VSelfDestruct </selfDestruct>
        <log> _ => ?_ </log>
        <refund> _ => ?_ </refund>
      </substate>
      <gasPrice> _ </gasPrice>
      <origin> ORIGIN_ID </origin>
      <blockhashes> _ </blockhashes>
      <block>
        <previousHash> _ </previousHash>
        <ommersHash> _ </ommersHash>
        <coinbase> _ </coinbase>
        <stateRoot> _ </stateRoot>
        <transactionsRoot> _ </transactionsRoot>
        <receiptsRoot> _ </receiptsRoot>
        <logsBloom> _ </logsBloom>
        <difficulty> _ </difficulty>
        <number> _BLOCK_NUMBER </number>
        <gasLimit> _ </gasLimit>
        <gasUsed> _ </gasUsed>
        <timestamp> TIME </timestamp>
        <extraData> _ </extraData>
        <mixHash> _ </mixHash>
        <blockNonce> _ </blockNonce>
        <ommerBlockHeaders> _ </ommerBlockHeaders>
      </block>
    </evm>
    <network>
      <chainID> VChainId </chainID>
      <activeAccounts> SetItem(ACCT_ID)
      SetItem(1)
      SetItem(2)
      SetItem(3)
      SetItem(4)
      SetItem(5)
      SetItem(6)
      SetItem(7)
      SetItem(8)
      SetItem(9) _ </activeAccounts>
      <accounts>
        <account>
          <acctID> ACCT_ID </acctID>
          <balance> ACCT_ID_balance </balance>
          <code> Vat_bin_runtime </code>
          <storage>
           .Map
          [#Vat.wards[CALLER_ID] <- (May) => May]
          [#Vat.live <- (Lives) => 0]
            _:Map
           </storage>
          <origStorage>
           .Map
          [#Vat.wards[CALLER_ID] <- (Junk_0)]
          [#Vat.live <- (Junk_1)]
            _:Map
           </origStorage>
          <nonce> Nonce_Vat => ?_ </nonce>
        </account>
        <account>
          <acctID> 1 </acctID>
          <balance> ECREC_BAL </balance>
          <code> .ByteArray </code>
          <storage> _:Map </storage>
          <origStorage> _ </origStorage>
          <nonce> _ </nonce>
        </account>
        <account>
          <acctID> 2 </acctID>
          <balance> SHA256_BAL </balance>
          <code> .ByteArray </code>
          <storage> _:Map </storage>
          <origStorage> _ </origStorage>
          <nonce> _ </nonce>
        </account>
        <account>
          <acctID> 3 </acctID>
          <balance> RIP160_BAL </balance>
          <code> .ByteArray </code>
          <storage> _:Map </storage>
          <origStorage> _ </origStorage>
          <nonce> _ </nonce>
        </account>
        <account>
          <acctID> 4 </acctID>
          <balance> ID_BAL </balance>
          <code> .ByteArray </code>
          <storage> _:Map </storage>
          <origStorage> _ </origStorage>
          <nonce> _ </nonce>
        </account>
        <account>
          <acctID> 5 </acctID>
          <balance> MODEXP_BAL </balance>
          <code> .ByteArray </code>
          <storage> _:Map </storage>
          <origStorage> _ </origStorage>
          <nonce> _ </nonce>
        </account>
        <account>
          <acctID> 6 </acctID>
          <balance> ECADD_BAL </balance>
          <code> .ByteArray </code>
          <storage> _:Map </storage>
          <origStorage> _ </origStorage>
          <nonce> _ </nonce>
        </account>
        <account>
          <acctID> 7 </acctID>
          <balance> ECMUL_BAL </balance>
          <code> .ByteArray </code>
          <storage> _:Map </storage>
          <origStorage> _ </origStorage>
          <nonce> _ </nonce>
        </account>
        <account>
          <acctID> 8 </acctID>
          <balance> ECPAIRING_BAL </balance>
          <code> .ByteArray </code>
          <storage> _:Map </storage>
          <origStorage> _ </origStorage>
          <nonce> _ </nonce>
        </account>
        <account>
          <acctID> 9 </acctID>
          <balance> BLAKE2_BAL </balance>
          <code> .ByteArray </code>
          <storage> _:Map </storage>
          <origStorage> _ </origStorage>
          <nonce> _ </nonce>
        </account>
       ...
      </accounts>
      <txOrder> _ </txOrder>
      <txPending> _ </txPending>
      <messages> _ </messages>
    </network>
  </ethereum>
requires #rangeAddress(ACCT_ID)
andBool ACCT_ID =/=Int 0
andBool #notPrecompileAddress(ACCT_ID)
andBool #rangeAddress(CALLER_ID)
andBool #rangeAddress(ORIGIN_ID)
andBool #rangeUInt(256, TIME)
andBool #rangeUInt(256, ACCT_ID_balance)
andBool #rangeUInt(256, ECREC_BAL)
andBool #rangeUInt(256, SHA256_BAL)
andBool #rangeUInt(256, RIP160_BAL)
andBool #rangeUInt(256, ID_BAL)
andBool #rangeUInt(256, MODEXP_BAL)
andBool #rangeUInt(256, ECADD_BAL)
andBool #rangeUInt(256, ECMUL_BAL)
andBool #rangeUInt(256, ECPAIRING_BAL)
andBool #rangeUInt(256, BLAKE2_BAL)
andBool VCallDepth <=Int 1024
andBool #rangeUInt(256, VCallValue)
andBool #rangeUInt(256, VChainId)

  andBool (#rangeUInt(256, May)
  andBool (#rangeUInt(256, Lives)
  andBool (#sizeByteArray(CD) <=Int 1250000000
  andBool (2300 <Int VGas -Int ((#if ( ( Lives ==K 0 ) orBool (notBool ( Junk_1 ==K Lives ) ) ) #then 0 #else 4200 #fi) +Int 6245)
  andBool (#rangeUInt(256, Junk_0)
  andBool (#rangeUInt(256, Junk_1)
  andBool ((VCallValue ==Int 0)
  andBool ((May ==Int 1)))))))))
[trusted]


// Cat_cage
rule [Cat.cage.pass]:
  <k> #execute ~> CONTINUATION => #halt ~> CONTINUATION </k>
  <exit-code> 1 </exit-code>
  <mode> NORMAL </mode>
  <schedule> ISTANBUL </schedule>
  <ethereum>
    <evm>
      <output> .ByteArray </output>
      <statusCode> _ => EVMC_SUCCESS </statusCode>
      <endPC> _ => ?_ </endPC>
      <callStack> _VCallStack </callStack>
      <interimStates> _ </interimStates>
      <touchedAccounts> _ => ?_ </touchedAccounts>
      <callState>
        <program> Cat_bin_runtime </program>
        <jumpDests> #computeValidJumpDests(Cat_bin_runtime) </jumpDests>
        <id> ACCT_ID </id>
        <caller> CALLER_ID </caller>
        <callData> #abiCallData("cage", .TypedArgs) ++ CD => ?_ </callData>
        <callValue> VCallValue </callValue>
        <wordStack> .WordStack => ?_ </wordStack>
        <localMem> .Memory => ?_ </localMem>
        <pc> 0 => ?_ </pc>
        <gas> VGas => VGas -Int ((#if ( ( Live ==K 0 ) orBool (notBool ( Junk_1 ==K Live ) ) ) #then 0 #else 4200 #fi) +Int 6307) </gas>
        <memoryUsed> 0 => ?_ </memoryUsed>
        <callGas> _ => ?_ </callGas>
        <static> false </static>
        <callDepth> VCallDepth </callDepth>
      </callState>
      <substate>
        <selfDestruct> _VSelfDestruct </selfDestruct>
        <log> _ => ?_ </log>
        <refund> _ => ?_ </refund>
      </substate>
      <gasPrice> _ </gasPrice>
      <origin> ORIGIN_ID </origin>
      <blockhashes> _ </blockhashes>
      <block>
        <previousHash> _ </previousHash>
        <ommersHash> _ </ommersHash>
        <coinbase> _ </coinbase>
        <stateRoot> _ </stateRoot>
        <transactionsRoot> _ </transactionsRoot>
        <receiptsRoot> _ </receiptsRoot>
        <logsBloom> _ </logsBloom>
        <difficulty> _ </difficulty>
        <number> _BLOCK_NUMBER </number>
        <gasLimit> _ </gasLimit>
        <gasUsed> _ </gasUsed>
        <timestamp> TIME </timestamp>
        <extraData> _ </extraData>
        <mixHash> _ </mixHash>
        <blockNonce> _ </blockNonce>
        <ommerBlockHeaders> _ </ommerBlockHeaders>
      </block>
    </evm>
    <network>
      <chainID> VChainId </chainID>
      <activeAccounts> SetItem(ACCT_ID)
      SetItem(1)
      SetItem(2)
      SetItem(3)
      SetItem(4)
      SetItem(5)
      SetItem(6)
      SetItem(7)
      SetItem(8)
      SetItem(9) _ </activeAccounts>
      <accounts>
        <account>
          <acctID> ACCT_ID </acctID>
          <balance> ACCT_ID_balance </balance>
          <code> Cat_bin_runtime </code>
          <storage>
           .Map
          [#Cat.wards[CALLER_ID] <- (Ward) => Ward]
          [#Cat.live <- (Live) => 0]
            _:Map
           </storage>
          <origStorage>
           .Map
          [#Cat.wards[CALLER_ID] <- (Junk_0)]
          [#Cat.live <- (Junk_1)]
            _:Map
           </origStorage>
          <nonce> Nonce_Cat => ?_ </nonce>
        </account>
        <account>
          <acctID> 1 </acctID>
          <balance> ECREC_BAL </balance>
          <code> .ByteArray </code>
          <storage> _:Map </storage>
          <origStorage> _ </origStorage>
          <nonce> _ </nonce>
        </account>
        <account>
          <acctID> 2 </acctID>
          <balance> SHA256_BAL </balance>
          <code> .ByteArray </code>
          <storage> _:Map </storage>
          <origStorage> _ </origStorage>
          <nonce> _ </nonce>
        </account>
        <account>
          <acctID> 3 </acctID>
          <balance> RIP160_BAL </balance>
          <code> .ByteArray </code>
          <storage> _:Map </storage>
          <origStorage> _ </origStorage>
          <nonce> _ </nonce>
        </account>
        <account>
          <acctID> 4 </acctID>
          <balance> ID_BAL </balance>
          <code> .ByteArray </code>
          <storage> _:Map </storage>
          <origStorage> _ </origStorage>
          <nonce> _ </nonce>
        </account>
        <account>
          <acctID> 5 </acctID>
          <balance> MODEXP_BAL </balance>
          <code> .ByteArray </code>
          <storage> _:Map </storage>
          <origStorage> _ </origStorage>
          <nonce> _ </nonce>
        </account>
        <account>
          <acctID> 6 </acctID>
          <balance> ECADD_BAL </balance>
          <code> .ByteArray </code>
          <storage> _:Map </storage>
          <origStorage> _ </origStorage>
          <nonce> _ </nonce>
        </account>
        <account>
          <acctID> 7 </acctID>
          <balance> ECMUL_BAL </balance>
          <code> .ByteArray </code>
          <storage> _:Map </storage>
          <origStorage> _ </origStorage>
          <nonce> _ </nonce>
        </account>
        <account>
          <acctID> 8 </acctID>
          <balance> ECPAIRING_BAL </balance>
          <code> .ByteArray </code>
          <storage> _:Map </storage>
          <origStorage> _ </origStorage>
          <nonce> _ </nonce>
        </account>
        <account>
          <acctID> 9 </acctID>
          <balance> BLAKE2_BAL </balance>
          <code> .ByteArray </code>
          <storage> _:Map </storage>
          <origStorage> _ </origStorage>
          <nonce> _ </nonce>
        </account>
       ...
      </accounts>
      <txOrder> _ </txOrder>
      <txPending> _ </txPending>
      <messages> _ </messages>
    </network>
  </ethereum>
requires #rangeAddress(ACCT_ID)
andBool ACCT_ID =/=Int 0
andBool #notPrecompileAddress(ACCT_ID)
andBool #rangeAddress(CALLER_ID)
andBool #rangeAddress(ORIGIN_ID)
andBool #rangeUInt(256, TIME)
andBool #rangeUInt(256, ACCT_ID_balance)
andBool #rangeUInt(256, ECREC_BAL)
andBool #rangeUInt(256, SHA256_BAL)
andBool #rangeUInt(256, RIP160_BAL)
andBool #rangeUInt(256, ID_BAL)
andBool #rangeUInt(256, MODEXP_BAL)
andBool #rangeUInt(256, ECADD_BAL)
andBool #rangeUInt(256, ECMUL_BAL)
andBool #rangeUInt(256, ECPAIRING_BAL)
andBool #rangeUInt(256, BLAKE2_BAL)
andBool VCallDepth <=Int 1024
andBool #rangeUInt(256, VCallValue)
andBool #rangeUInt(256, VChainId)

  andBool (#rangeUInt(256, Ward)
  andBool (#rangeUInt(256, Live)
  andBool (#sizeByteArray(CD) <=Int 1250000000
  andBool (2300 <Int VGas -Int ((#if ( ( Live ==K 0 ) orBool (notBool ( Junk_1 ==K Live ) ) ) #then 0 #else 4200 #fi) +Int 6307)
  andBool (#rangeUInt(256, Junk_0)
  andBool (#rangeUInt(256, Junk_1)
  andBool ((Ward ==Int 1)
  andBool ((VCallValue ==Int 0)))))))))
[trusted]


// Vow_cage-surplus
rule [Vow.cage-surplus.pass]:
  <k> #execute ~> CONTINUATION => #halt ~> CONTINUATION </k>
  <exit-code> 1 </exit-code>
  <mode> NORMAL </mode>
  <schedule> ISTANBUL </schedule>
  <ethereum>
    <evm>
      <output> .ByteArray </output>
      <statusCode> _ => EVMC_SUCCESS </statusCode>
      <endPC> _ => ?_ </endPC>
      <callStack> _VCallStack </callStack>
      <interimStates> _ </interimStates>
      <touchedAccounts> _ => ?_ </touchedAccounts>
      <callState>
        <program> Vow_bin_runtime </program>
        <jumpDests> #computeValidJumpDests(Vow_bin_runtime) </jumpDests>
        <id> ACCT_ID </id>
        <caller> CALLER_ID </caller>
        <callData> #abiCallData("cage", .TypedArgs) ++ CD => ?_ </callData>
        <callValue> VCallValue </callValue>
        <wordStack> .WordStack => ?_ </wordStack>
        <localMem> .Memory => ?_ </localMem>
        <pc> 0 => ?_ </pc>
        <gas> VGas => ( VGas -Int ( (#if (notBool ( Junk_4 ==K 1 ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Sin ==K 0 ) orBool (notBool ( Junk_5 ==K Sin ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Ash ==K 0 ) orBool (notBool ( Junk_6 ==K Ash ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( FlapLive ==K 0 ) orBool (notBool ( Junk_16 ==K FlapLive ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Dai_f ==K 0 ) orBool (notBool ( Junk_9 ==K Dai_f ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Dai_v ==K ( Dai_v +Int Dai_f ) ) orBool (notBool ( Junk_10 ==K Dai_v ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Junk_10 ==K 0 ) andBool (notBool ( ( Dai_v ==K ( Dai_v +Int Dai_f ) ) orBool (notBool ( Junk_10 ==K Dai_v ) ) ) ) ) #then 15000 #else 0 #fi) +Int ( (#if ( ( FlopLive ==K 0 ) orBool (notBool ( Junk_18 ==K FlopLive ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( FlopVow ==K ACCT_ID ) orBool (notBool ( Junk_19 ==K FlopVow ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Junk_19 ==K 0 ) andBool (notBool ( ( FlopVow ==K ACCT_ID ) orBool (notBool ( Junk_19 ==K FlopVow ) ) ) ) ) #then 15000 #else 0 #fi) +Int ( (#if ( ( Sin_v ==K 0 ) orBool (notBool ( Junk_11 ==K Sin_v ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( ( Dai_v +Int Dai_f ) ==K ( Dai_v +Int ( Dai_f -Int Sin_v ) ) ) orBool (notBool ( Junk_10 ==K ( Dai_v +Int Dai_f ) ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Vice ==K ( Vice -Int Sin_v ) ) orBool (notBool ( Junk_13 ==K Vice ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Debt ==K ( Debt -Int Sin_v ) ) orBool (notBool ( Junk_12 ==K Debt ) ) ) #then 0 #else 4200 #fi) +Int 66155 ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) </gas>
        <memoryUsed> 0 => ?_ </memoryUsed>
        <callGas> _ => ?_ </callGas>
        <static> false </static>
        <callDepth> VCallDepth </callDepth>
      </callState>
      <substate>
        <selfDestruct> _VSelfDestruct </selfDestruct>
        <log> _ => ?_ </log>
        <refund> _ => ?_ </refund>
      </substate>
      <gasPrice> _ </gasPrice>
      <origin> ORIGIN_ID </origin>
      <blockhashes> _ </blockhashes>
      <block>
        <previousHash> _ </previousHash>
        <ommersHash> _ </ommersHash>
        <coinbase> _ </coinbase>
        <stateRoot> _ </stateRoot>
        <transactionsRoot> _ </transactionsRoot>
        <receiptsRoot> _ </receiptsRoot>
        <logsBloom> _ </logsBloom>
        <difficulty> _ </difficulty>
        <number> _BLOCK_NUMBER </number>
        <gasLimit> _ </gasLimit>
        <gasUsed> _ </gasUsed>
        <timestamp> TIME </timestamp>
        <extraData> _ </extraData>
        <mixHash> _ </mixHash>
        <blockNonce> _ </blockNonce>
        <ommerBlockHeaders> _ </ommerBlockHeaders>
      </block>
    </evm>
    <network>
      <chainID> VChainId </chainID>
      <activeAccounts> SetItem(ACCT_ID)
      SetItem(Vat)
      SetItem(Flapper)
      SetItem(Flopper)
      SetItem(1)
      SetItem(2)
      SetItem(3)
      SetItem(4)
      SetItem(5)
      SetItem(6)
      SetItem(7)
      SetItem(8)
      SetItem(9) _ </activeAccounts>
      <accounts>
        <account>
          <acctID> ACCT_ID </acctID>
          <balance> ACCT_ID_balance </balance>
          <code> Vow_bin_runtime </code>
          <storage>
           .Map
          [#Vow.wards[CALLER_ID] <- (Can) => Can]
          [#Vow.vat <- (Vat) => Vat]
          [#Vow.flopper <- (Flopper) => Flopper]
          [#Vow.flapper <- (Flapper) => Flapper]
          [#Vow.live <- (Live) => 0]
          [#Vow.Sin <- (Sin) => 0]
          [#Vow.Ash <- (Ash) => 0]
            _:Map
           </storage>
          <origStorage>
           .Map
          [#Vow.wards[CALLER_ID] <- (Junk_0)]
          [#Vow.vat <- (Junk_1)]
          [#Vow.flopper <- (Junk_2)]
          [#Vow.flapper <- (Junk_3)]
          [#Vow.live <- (Junk_4)]
          [#Vow.Sin <- (Junk_5)]
          [#Vow.Ash <- (Junk_6)]
            _:Map
           </origStorage>
          <nonce> Nonce_Vow => ?_ </nonce>
        </account>
        <account>
          <acctID> Vat </acctID>
          <balance> Vat_balance </balance>
          <code> Vat_bin_runtime </code>
          <storage>
           .Map
          [#Vat.can[Flapper][Flapper] <- (Junk_7) => _]
          [#Vat.dai[Flapper] <- (Dai_f) => 0]
          [#Vat.dai[ACCT_ID] <- (Dai_v) => (Dai_v +Int Dai_f) -Int Sin_v]
          [#Vat.sin[ACCT_ID] <- (Sin_v) => 0]
          [#Vat.debt <- (Debt) => Debt -Int Sin_v]
          [#Vat.vice <- (Vice) => Vice -Int Sin_v]
            _:Map
           </storage>
          <origStorage>
           .Map
          [#Vat.can[Flapper][Flapper] <- (Junk_8)]
          [#Vat.dai[Flapper] <- (Junk_9)]
          [#Vat.dai[ACCT_ID] <- (Junk_10)]
          [#Vat.sin[ACCT_ID] <- (Junk_11)]
          [#Vat.debt <- (Junk_12)]
          [#Vat.vice <- (Junk_13)]
            _:Map
           </origStorage>
          <nonce> Nonce_Vat => ?_ </nonce>
        </account>
        <account>
          <acctID> Flapper </acctID>
          <balance> Flapper_balance </balance>
          <code> Flapper_bin_runtime </code>
          <storage>
           .Map
          [#Flapper.wards[ACCT_ID] <- (MayFlap) => MayFlap]
          [#Flapper.vat <- (FlapVat) => FlapVat]
          [#Flapper.live <- (FlapLive) => 0]
            _:Map
           </storage>
          <origStorage>
           .Map
          [#Flapper.wards[ACCT_ID] <- (Junk_14)]
          [#Flapper.vat <- (Junk_15)]
          [#Flapper.live <- (Junk_16)]
            _:Map
           </origStorage>
          <nonce> Nonce_Flapper => ?_ </nonce>
        </account>
        <account>
          <acctID> Flopper </acctID>
          <balance> Flopper_balance </balance>
          <code> Flopper_bin_runtime </code>
          <storage>
           .Map
          [#Flopper.wards[ACCT_ID] <- (MayFlop) => MayFlop]
          [#Flopper.live <- (FlopLive) => 0]
          [#Flopper.vow <- (FlopVow) => ACCT_ID]
            _:Map
           </storage>
          <origStorage>
           .Map
          [#Flopper.wards[ACCT_ID] <- (Junk_17)]
          [#Flopper.live <- (Junk_18)]
          [#Flopper.vow <- (Junk_19)]
            _:Map
           </origStorage>
          <nonce> _Nonce_Flopper => ?_ </nonce>
        </account>
        <account>
          <acctID> 1 </acctID>
          <balance> ECREC_BAL </balance>
          <code> .ByteArray </code>
          <storage> _:Map </storage>
          <origStorage> _ </origStorage>
          <nonce> _ </nonce>
        </account>
        <account>
          <acctID> 2 </acctID>
          <balance> SHA256_BAL </balance>
          <code> .ByteArray </code>
          <storage> _:Map </storage>
          <origStorage> _ </origStorage>
          <nonce> _ </nonce>
        </account>
        <account>
          <acctID> 3 </acctID>
          <balance> RIP160_BAL </balance>
          <code> .ByteArray </code>
          <storage> _:Map </storage>
          <origStorage> _ </origStorage>
          <nonce> _ </nonce>
        </account>
        <account>
          <acctID> 4 </acctID>
          <balance> ID_BAL </balance>
          <code> .ByteArray </code>
          <storage> _:Map </storage>
          <origStorage> _ </origStorage>
          <nonce> _ </nonce>
        </account>
        <account>
          <acctID> 5 </acctID>
          <balance> MODEXP_BAL </balance>
          <code> .ByteArray </code>
          <storage> _:Map </storage>
          <origStorage> _ </origStorage>
          <nonce> _ </nonce>
        </account>
        <account>
          <acctID> 6 </acctID>
          <balance> ECADD_BAL </balance>
          <code> .ByteArray </code>
          <storage> _:Map </storage>
          <origStorage> _ </origStorage>
          <nonce> _ </nonce>
        </account>
        <account>
          <acctID> 7 </acctID>
          <balance> ECMUL_BAL </balance>
          <code> .ByteArray </code>
          <storage> _:Map </storage>
          <origStorage> _ </origStorage>
          <nonce> _ </nonce>
        </account>
        <account>
          <acctID> 8 </acctID>
          <balance> ECPAIRING_BAL </balance>
          <code> .ByteArray </code>
          <storage> _:Map </storage>
          <origStorage> _ </origStorage>
          <nonce> _ </nonce>
        </account>
        <account>
          <acctID> 9 </acctID>
          <balance> BLAKE2_BAL </balance>
          <code> .ByteArray </code>
          <storage> _:Map </storage>
          <origStorage> _ </origStorage>
          <nonce> _ </nonce>
        </account>
       ...
      </accounts>
      <txOrder> _ </txOrder>
      <txPending> _ </txPending>
      <messages> _ </messages>
    </network>
  </ethereum>
requires #rangeAddress(ACCT_ID)
andBool ACCT_ID =/=Int 0
andBool #notPrecompileAddress(ACCT_ID)
andBool #rangeAddress(CALLER_ID)
andBool #rangeAddress(ORIGIN_ID)
andBool #rangeUInt(256, TIME)
andBool #rangeUInt(256, ACCT_ID_balance)
andBool #rangeUInt(256, ECREC_BAL)
andBool #rangeUInt(256, SHA256_BAL)
andBool #rangeUInt(256, RIP160_BAL)
andBool #rangeUInt(256, ID_BAL)
andBool #rangeUInt(256, MODEXP_BAL)
andBool #rangeUInt(256, ECADD_BAL)
andBool #rangeUInt(256, ECMUL_BAL)
andBool #rangeUInt(256, ECPAIRING_BAL)
andBool #rangeUInt(256, BLAKE2_BAL)
andBool VCallDepth <=Int 1024
andBool #rangeUInt(256, VCallValue)
andBool #rangeUInt(256, VChainId)

  andBool (#rangeAddress(Vat)
  andBool (#rangeAddress(Flapper)
  andBool (#rangeAddress(Flopper)
  andBool (#rangeAddress(FlapVat)
  andBool (#rangeUInt(256, MayFlap)
  andBool (#rangeUInt(256, MayFlop)
  andBool (#rangeUInt(256, Dai_v)
  andBool (#rangeUInt(256, Sin_v)
  andBool (#rangeUInt(256, Dai_f)
  andBool (#rangeUInt(256, Debt)
  andBool (#rangeUInt(256, Vice)
  andBool (#rangeUInt(256, Live)
  andBool (#rangeUInt(256, Sin)
  andBool (#rangeUInt(256, Ash)
  andBool (#rangeUInt(256, FlapLive)
  andBool (#rangeUInt(256, FlopLive)
  andBool (#rangeAddress(FlopVow)
  andBool (#rangeUInt(256, Vat_balance)
  andBool (#rangeUInt(256, Flapper_balance)
  andBool (#rangeUInt(256, Flopper_balance)
  andBool ((#sizeByteArray(CD) <=Int 1250000000)
  andBool ((#notPrecompileAddress(Vat))
  andBool ((#notPrecompileAddress(Flapper))
  andBool ((#notPrecompileAddress(Flopper))
  andBool ((#notPrecompileAddress(FlapVat))
  andBool ((#notPrecompileAddress(FlopVow))
  andBool ((ACCT_ID =/=Int Vat)
  andBool ((ACCT_ID =/=Int Flapper)
  andBool ((ACCT_ID =/=Int Flopper)
  andBool ((Dai_v +Int Dai_f >Int Sin_v)
  andBool ((Flapper =/=Int ACCT_ID)
  andBool ((Flapper =/=Int Vat)
  andBool ((Flopper =/=Int ACCT_ID)
  andBool ((Flopper =/=Int Vat)
  andBool ((Flopper =/=Int Flapper)
  andBool ((FlapVat ==Int  Vat)
  andBool ((Vat =/=Int 0)
  andBool ((Flapper =/=Int 0)
  andBool ((Flopper =/=Int 0)
  andBool (2300 <Int ( VGas -Int ( (#if (notBool ( Junk_4 ==K 1 ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Sin ==K 0 ) orBool (notBool ( Junk_5 ==K Sin ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Ash ==K 0 ) orBool (notBool ( Junk_6 ==K Ash ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( FlapLive ==K 0 ) orBool (notBool ( Junk_16 ==K FlapLive ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Dai_f ==K 0 ) orBool (notBool ( Junk_9 ==K Dai_f ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Dai_v ==K ( Dai_v +Int Dai_f ) ) orBool (notBool ( Junk_10 ==K Dai_v ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Junk_10 ==K 0 ) andBool (notBool ( ( Dai_v ==K ( Dai_v +Int Dai_f ) ) orBool (notBool ( Junk_10 ==K Dai_v ) ) ) ) ) #then 15000 #else 0 #fi) +Int ( (#if ( ( FlopLive ==K 0 ) orBool (notBool ( Junk_18 ==K FlopLive ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( FlopVow ==K ACCT_ID ) orBool (notBool ( Junk_19 ==K FlopVow ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Junk_19 ==K 0 ) andBool (notBool ( ( FlopVow ==K ACCT_ID ) orBool (notBool ( Junk_19 ==K FlopVow ) ) ) ) ) #then 15000 #else 0 #fi) +Int ( (#if ( ( Sin_v ==K 0 ) orBool (notBool ( Junk_11 ==K Sin_v ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( ( Dai_v +Int Dai_f ) ==K ( Dai_v +Int ( Dai_f -Int Sin_v ) ) ) orBool (notBool ( Junk_10 ==K ( Dai_v +Int Dai_f ) ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Vice ==K ( Vice -Int Sin_v ) ) orBool (notBool ( Junk_13 ==K Vice ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Debt ==K ( Debt -Int Sin_v ) ) orBool (notBool ( Junk_12 ==K Debt ) ) ) #then 0 #else 4200 #fi) +Int 66155 ) ) ) ) ) ) ) ) ) ) ) ) ) ) )
  andBool (2300 <Int ( VGas -Int ( (#if (notBool ( Junk_4 ==K 1 ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Sin ==K 0 ) orBool (notBool ( Junk_5 ==K Sin ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Ash ==K 0 ) orBool (notBool ( Junk_6 ==K Ash ) ) ) #then 0 #else 4200 #fi) +Int ( ( ( VGas -Int ( (#if (notBool ( Junk_4 ==K 1 ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Sin ==K 0 ) orBool (notBool ( Junk_5 ==K Sin ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Ash ==K 0 ) orBool (notBool ( Junk_6 ==K Ash ) ) ) #then 0 #else 4200 #fi) +Int 8513 ) ) ) ) /Int 64 ) +Int 9749 ) ) ) ) )
  andBool (2300 <Int ( VGas -Int ( (#if (notBool ( Junk_4 ==K 1 ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Sin ==K 0 ) orBool (notBool ( Junk_5 ==K Sin ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Ash ==K 0 ) orBool (notBool ( Junk_6 ==K Ash ) ) ) #then 0 #else 4200 #fi) +Int ( ( ( VGas -Int ( (#if (notBool ( Junk_4 ==K 1 ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Sin ==K 0 ) orBool (notBool ( Junk_5 ==K Sin ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Ash ==K 0 ) orBool (notBool ( Junk_6 ==K Ash ) ) ) #then 0 #else 4200 #fi) +Int 11374 ) ) ) ) /Int 64 ) +Int ( (#if ( ( FlapLive ==K 0 ) orBool (notBool ( Junk_16 ==K FlapLive ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Dai_f ==K 0 ) orBool (notBool ( Junk_9 ==K Dai_f ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Dai_v ==K ( Dai_v +Int Dai_f ) ) orBool (notBool ( Junk_10 ==K Dai_v ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Junk_10 ==K 0 ) andBool (notBool ( ( Dai_v ==K ( Dai_v +Int Dai_f ) ) orBool (notBool ( Junk_10 ==K Dai_v ) ) ) ) ) #then 15000 #else 0 #fi) +Int 29738 ) ) ) ) ) ) ) ) )
  andBool (2300 <Int ( VGas -Int ( (#if (notBool ( Junk_4 ==K 1 ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Sin ==K 0 ) orBool (notBool ( Junk_5 ==K Sin ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Ash ==K 0 ) orBool (notBool ( Junk_6 ==K Ash ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( FlapLive ==K 0 ) orBool (notBool ( Junk_16 ==K FlapLive ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Dai_f ==K 0 ) orBool (notBool ( Junk_9 ==K Dai_f ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Dai_v ==K ( Dai_v +Int Dai_f ) ) orBool (notBool ( Junk_10 ==K Dai_v ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Junk_10 ==K 0 ) andBool (notBool ( ( Dai_v ==K ( Dai_v +Int Dai_f ) ) orBool (notBool ( Junk_10 ==K Dai_v ) ) ) ) ) #then 15000 #else 0 #fi) +Int ( ( ( VGas -Int ( (#if (notBool ( Junk_4 ==K 1 ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Sin ==K 0 ) orBool (notBool ( Junk_5 ==K Sin ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Ash ==K 0 ) orBool (notBool ( Junk_6 ==K Ash ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( FlapLive ==K 0 ) orBool (notBool ( Junk_16 ==K FlapLive ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Dai_f ==K 0 ) orBool (notBool ( Junk_9 ==K Dai_f ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Dai_v ==K ( Dai_v +Int Dai_f ) ) orBool (notBool ( Junk_10 ==K Dai_v ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Junk_10 ==K 0 ) andBool (notBool ( ( Dai_v ==K ( Dai_v +Int Dai_f ) ) orBool (notBool ( Junk_10 ==K Dai_v ) ) ) ) ) #then 15000 #else 0 #fi) +Int 32107 ) ) ) ) ) ) ) ) /Int 64 ) +Int ( (#if ( ( FlopLive ==K 0 ) orBool (notBool ( Junk_18 ==K FlopLive ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( FlopVow ==K ACCT_ID ) orBool (notBool ( Junk_19 ==K FlopVow ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Junk_19 ==K 0 ) andBool (notBool ( ( FlopVow ==K ACCT_ID ) orBool (notBool ( Junk_19 ==K FlopVow ) ) ) ) ) #then 15000 #else 0 #fi) +Int 40058 ) ) ) ) ) ) ) ) ) ) ) )
  andBool (2300 <Int ( VGas -Int ( (#if (notBool ( Junk_4 ==K 1 ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Sin ==K 0 ) orBool (notBool ( Junk_5 ==K Sin ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Ash ==K 0 ) orBool (notBool ( Junk_6 ==K Ash ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( FlapLive ==K 0 ) orBool (notBool ( Junk_16 ==K FlapLive ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Dai_f ==K 0 ) orBool (notBool ( Junk_9 ==K Dai_f ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Dai_v ==K ( Dai_v +Int Dai_f ) ) orBool (notBool ( Junk_10 ==K Dai_v ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Junk_10 ==K 0 ) andBool (notBool ( ( Dai_v ==K ( Dai_v +Int Dai_f ) ) orBool (notBool ( Junk_10 ==K Dai_v ) ) ) ) ) #then 15000 #else 0 #fi) +Int ( (#if ( ( FlopLive ==K 0 ) orBool (notBool ( Junk_18 ==K FlopLive ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( FlopVow ==K ACCT_ID ) orBool (notBool ( Junk_19 ==K FlopVow ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Junk_19 ==K 0 ) andBool (notBool ( ( FlopVow ==K ACCT_ID ) orBool (notBool ( Junk_19 ==K FlopVow ) ) ) ) ) #then 15000 #else 0 #fi) +Int ( ( ( VGas -Int ( (#if (notBool ( Junk_4 ==K 1 ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Sin ==K 0 ) orBool (notBool ( Junk_5 ==K Sin ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Ash ==K 0 ) orBool (notBool ( Junk_6 ==K Ash ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( FlapLive ==K 0 ) orBool (notBool ( Junk_16 ==K FlapLive ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Dai_f ==K 0 ) orBool (notBool ( Junk_9 ==K Dai_f ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Dai_v ==K ( Dai_v +Int Dai_f ) ) orBool (notBool ( Junk_10 ==K Dai_v ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Junk_10 ==K 0 ) andBool (notBool ( ( Dai_v ==K ( Dai_v +Int Dai_f ) ) orBool (notBool ( Junk_10 ==K Dai_v ) ) ) ) ) #then 15000 #else 0 #fi) +Int ( (#if ( ( FlopLive ==K 0 ) orBool (notBool ( Junk_18 ==K FlopLive ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( FlopVow ==K ACCT_ID ) orBool (notBool ( Junk_19 ==K FlopVow ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Junk_19 ==K 0 ) andBool (notBool ( ( FlopVow ==K ACCT_ID ) orBool (notBool ( Junk_19 ==K FlopVow ) ) ) ) ) #then 15000 #else 0 #fi) +Int 43314 ) ) ) ) ) ) ) ) ) ) ) /Int 64 ) +Int 44550 ) ) ) ) ) ) ) ) ) ) ) )
  andBool (2300 <Int ( VGas -Int ( (#if (notBool ( Junk_4 ==K 1 ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Sin ==K 0 ) orBool (notBool ( Junk_5 ==K Sin ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Ash ==K 0 ) orBool (notBool ( Junk_6 ==K Ash ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( FlapLive ==K 0 ) orBool (notBool ( Junk_16 ==K FlapLive ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Dai_f ==K 0 ) orBool (notBool ( Junk_9 ==K Dai_f ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Dai_v ==K ( Dai_v +Int Dai_f ) ) orBool (notBool ( Junk_10 ==K Dai_v ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Junk_10 ==K 0 ) andBool (notBool ( ( Dai_v ==K ( Dai_v +Int Dai_f ) ) orBool (notBool ( Junk_10 ==K Dai_v ) ) ) ) ) #then 15000 #else 0 #fi) +Int ( (#if ( ( FlopLive ==K 0 ) orBool (notBool ( Junk_18 ==K FlopLive ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( FlopVow ==K ACCT_ID ) orBool (notBool ( Junk_19 ==K FlopVow ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Junk_19 ==K 0 ) andBool (notBool ( ( FlopVow ==K ACCT_ID ) orBool (notBool ( Junk_19 ==K FlopVow ) ) ) ) ) #then 15000 #else 0 #fi) +Int ( ( ( VGas -Int ( (#if (notBool ( Junk_4 ==K 1 ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Sin ==K 0 ) orBool (notBool ( Junk_5 ==K Sin ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Ash ==K 0 ) orBool (notBool ( Junk_6 ==K Ash ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( FlapLive ==K 0 ) orBool (notBool ( Junk_16 ==K FlapLive ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Dai_f ==K 0 ) orBool (notBool ( Junk_9 ==K Dai_f ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Dai_v ==K ( Dai_v +Int Dai_f ) ) orBool (notBool ( Junk_10 ==K Dai_v ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Junk_10 ==K 0 ) andBool (notBool ( ( Dai_v ==K ( Dai_v +Int Dai_f ) ) orBool (notBool ( Junk_10 ==K Dai_v ) ) ) ) ) #then 15000 #else 0 #fi) +Int ( (#if ( ( FlopLive ==K 0 ) orBool (notBool ( Junk_18 ==K FlopLive ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( FlopVow ==K ACCT_ID ) orBool (notBool ( Junk_19 ==K FlopVow ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Junk_19 ==K 0 ) andBool (notBool ( ( FlopVow ==K ACCT_ID ) orBool (notBool ( Junk_19 ==K FlopVow ) ) ) ) ) #then 15000 #else 0 #fi) +Int 47034 ) ) ) ) ) ) ) ) ) ) ) /Int 64 ) +Int 48269 ) ) ) ) ) ) ) ) ) ) ) )
  andBool (2300 <Int ( VGas -Int ( (#if (notBool ( Junk_4 ==K 1 ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Sin ==K 0 ) orBool (notBool ( Junk_5 ==K Sin ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Ash ==K 0 ) orBool (notBool ( Junk_6 ==K Ash ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( FlapLive ==K 0 ) orBool (notBool ( Junk_16 ==K FlapLive ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Dai_f ==K 0 ) orBool (notBool ( Junk_9 ==K Dai_f ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Dai_v ==K ( Dai_v +Int Dai_f ) ) orBool (notBool ( Junk_10 ==K Dai_v ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Junk_10 ==K 0 ) andBool (notBool ( ( Dai_v ==K ( Dai_v +Int Dai_f ) ) orBool (notBool ( Junk_10 ==K Dai_v ) ) ) ) ) #then 15000 #else 0 #fi) +Int ( (#if ( ( FlopLive ==K 0 ) orBool (notBool ( Junk_18 ==K FlopLive ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( FlopVow ==K ACCT_ID ) orBool (notBool ( Junk_19 ==K FlopVow ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Junk_19 ==K 0 ) andBool (notBool ( ( FlopVow ==K ACCT_ID ) orBool (notBool ( Junk_19 ==K FlopVow ) ) ) ) ) #then 15000 #else 0 #fi) +Int ( ( ( VGas -Int ( (#if (notBool ( Junk_4 ==K 1 ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Sin ==K 0 ) orBool (notBool ( Junk_5 ==K Sin ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Ash ==K 0 ) orBool (notBool ( Junk_6 ==K Ash ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( FlapLive ==K 0 ) orBool (notBool ( Junk_16 ==K FlapLive ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Dai_f ==K 0 ) orBool (notBool ( Junk_9 ==K Dai_f ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Dai_v ==K ( Dai_v +Int Dai_f ) ) orBool (notBool ( Junk_10 ==K Dai_v ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Junk_10 ==K 0 ) andBool (notBool ( ( Dai_v ==K ( Dai_v +Int Dai_f ) ) orBool (notBool ( Junk_10 ==K Dai_v ) ) ) ) ) #then 15000 #else 0 #fi) +Int ( (#if ( ( FlopLive ==K 0 ) orBool (notBool ( Junk_18 ==K FlopLive ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( FlopVow ==K ACCT_ID ) orBool (notBool ( Junk_19 ==K FlopVow ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Junk_19 ==K 0 ) andBool (notBool ( ( FlopVow ==K ACCT_ID ) orBool (notBool ( Junk_19 ==K FlopVow ) ) ) ) ) #then 15000 #else 0 #fi) +Int 49973 ) ) ) ) ) ) ) ) ) ) ) /Int 64 ) +Int ( (#if ( ( Sin_v ==K 0 ) orBool (notBool ( Junk_11 ==K Sin_v ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( ( Dai_v +Int Dai_f ) ==K ( Dai_v +Int ( Dai_f -Int Sin_v ) ) ) orBool (notBool ( Junk_10 ==K ( Dai_v +Int Dai_f ) ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Vice ==K ( Vice -Int Sin_v ) ) orBool (notBool ( Junk_13 ==K Vice ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Debt ==K ( Debt -Int Sin_v ) ) orBool (notBool ( Junk_12 ==K Debt ) ) ) #then 0 #else 4200 #fi) +Int 61789 ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) )
  andBool (#rangeUInt(256, Junk_0)
  andBool (#rangeUInt(256, Junk_1)
  andBool (#rangeUInt(256, Junk_2)
  andBool (#rangeUInt(256, Junk_3)
  andBool (#rangeUInt(256, Junk_4)
  andBool (#rangeUInt(256, Junk_5)
  andBool (#rangeUInt(256, Junk_6)
  andBool (#rangeUInt(256, Junk_7)
  andBool (#rangeUInt(256, Junk_8)
  andBool (#rangeUInt(256, Junk_9)
  andBool (#rangeUInt(256, Junk_10)
  andBool (#rangeUInt(256, Junk_11)
  andBool (#rangeUInt(256, Junk_12)
  andBool (#rangeUInt(256, Junk_13)
  andBool (#rangeUInt(256, Junk_14)
  andBool (#rangeUInt(256, Junk_15)
  andBool (#rangeUInt(256, Junk_16)
  andBool (#rangeUInt(256, Junk_17)
  andBool (#rangeUInt(256, Junk_18)
  andBool (#rangeUInt(256, Junk_19)
  andBool (((VCallValue ==Int 0))
  andBool (((VCallDepth <Int 1023))
  andBool (((Live ==Int 1))
  andBool (((Can ==Int 1))
  andBool (((MayFlap ==Int 1))
  andBool (((MayFlop ==Int 1))
  andBool ((#rangeUInt(256, Dai_v +Int Dai_f))
  andBool ((#rangeUInt(256, Debt -Int Sin_v))
  andBool ((#rangeUInt(256, Vice -Int Sin_v)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
[trusted]


// Spotter_cage
rule [Spotter.cage.pass]:
  <k> #execute ~> CONTINUATION => #halt ~> CONTINUATION </k>
  <exit-code> 1 </exit-code>
  <mode> NORMAL </mode>
  <schedule> ISTANBUL </schedule>
  <ethereum>
    <evm>
      <output> .ByteArray </output>
      <statusCode> _ => EVMC_SUCCESS </statusCode>
      <endPC> _ => ?_ </endPC>
      <callStack> _VCallStack </callStack>
      <interimStates> _ </interimStates>
      <touchedAccounts> _ => ?_ </touchedAccounts>
      <callState>
        <program> Spotter_bin_runtime </program>
        <jumpDests> #computeValidJumpDests(Spotter_bin_runtime) </jumpDests>
        <id> ACCT_ID </id>
        <caller> CALLER_ID </caller>
        <callData> #abiCallData("cage", .TypedArgs) ++ CD => ?_ </callData>
        <callValue> VCallValue </callValue>
        <wordStack> .WordStack => ?_ </wordStack>
        <localMem> .Memory => ?_ </localMem>
        <pc> 0 => ?_ </pc>
        <gas> VGas => VGas -Int ((#if ( ( Junk_0 ==K 0 ) orBool (notBool ( Junk_2 ==K Junk_0 ) ) ) #then 0 #else 4200 #fi) +Int 6196) </gas>
        <memoryUsed> 0 => ?_ </memoryUsed>
        <callGas> _ => ?_ </callGas>
        <static> false </static>
        <callDepth> VCallDepth </callDepth>
      </callState>
      <substate>
        <selfDestruct> _VSelfDestruct </selfDestruct>
        <log> _ => ?_ </log>
        <refund> _ => ?_ </refund>
      </substate>
      <gasPrice> _ </gasPrice>
      <origin> ORIGIN_ID </origin>
      <blockhashes> _ </blockhashes>
      <block>
        <previousHash> _ </previousHash>
        <ommersHash> _ </ommersHash>
        <coinbase> _ </coinbase>
        <stateRoot> _ </stateRoot>
        <transactionsRoot> _ </transactionsRoot>
        <receiptsRoot> _ </receiptsRoot>
        <logsBloom> _ </logsBloom>
        <difficulty> _ </difficulty>
        <number> _BLOCK_NUMBER </number>
        <gasLimit> _ </gasLimit>
        <gasUsed> _ </gasUsed>
        <timestamp> TIME </timestamp>
        <extraData> _ </extraData>
        <mixHash> _ </mixHash>
        <blockNonce> _ </blockNonce>
        <ommerBlockHeaders> _ </ommerBlockHeaders>
      </block>
    </evm>
    <network>
      <chainID> VChainId </chainID>
      <activeAccounts> SetItem(ACCT_ID)
      SetItem(1)
      SetItem(2)
      SetItem(3)
      SetItem(4)
      SetItem(5)
      SetItem(6)
      SetItem(7)
      SetItem(8)
      SetItem(9) _ </activeAccounts>
      <accounts>
        <account>
          <acctID> ACCT_ID </acctID>
          <balance> ACCT_ID_balance </balance>
          <code> Spotter_bin_runtime </code>
          <storage>
           .Map
          [#Spotter.wards[CALLER_ID] <- (May) => May]
          [#Spotter.live <- (Junk_0) => 0]
            _:Map
           </storage>
          <origStorage>
           .Map
          [#Spotter.wards[CALLER_ID] <- (Junk_1)]
          [#Spotter.live <- (Junk_2)]
            _:Map
           </origStorage>
          <nonce> _Nonce_Spotter => ?_ </nonce>
        </account>
        <account>
          <acctID> 1 </acctID>
          <balance> ECREC_BAL </balance>
          <code> .ByteArray </code>
          <storage> _:Map </storage>
          <origStorage> _ </origStorage>
          <nonce> _ </nonce>
        </account>
        <account>
          <acctID> 2 </acctID>
          <balance> SHA256_BAL </balance>
          <code> .ByteArray </code>
          <storage> _:Map </storage>
          <origStorage> _ </origStorage>
          <nonce> _ </nonce>
        </account>
        <account>
          <acctID> 3 </acctID>
          <balance> RIP160_BAL </balance>
          <code> .ByteArray </code>
          <storage> _:Map </storage>
          <origStorage> _ </origStorage>
          <nonce> _ </nonce>
        </account>
        <account>
          <acctID> 4 </acctID>
          <balance> ID_BAL </balance>
          <code> .ByteArray </code>
          <storage> _:Map </storage>
          <origStorage> _ </origStorage>
          <nonce> _ </nonce>
        </account>
        <account>
          <acctID> 5 </acctID>
          <balance> MODEXP_BAL </balance>
          <code> .ByteArray </code>
          <storage> _:Map </storage>
          <origStorage> _ </origStorage>
          <nonce> _ </nonce>
        </account>
        <account>
          <acctID> 6 </acctID>
          <balance> ECADD_BAL </balance>
          <code> .ByteArray </code>
          <storage> _:Map </storage>
          <origStorage> _ </origStorage>
          <nonce> _ </nonce>
        </account>
        <account>
          <acctID> 7 </acctID>
          <balance> ECMUL_BAL </balance>
          <code> .ByteArray </code>
          <storage> _:Map </storage>
          <origStorage> _ </origStorage>
          <nonce> _ </nonce>
        </account>
        <account>
          <acctID> 8 </acctID>
          <balance> ECPAIRING_BAL </balance>
          <code> .ByteArray </code>
          <storage> _:Map </storage>
          <origStorage> _ </origStorage>
          <nonce> _ </nonce>
        </account>
        <account>
          <acctID> 9 </acctID>
          <balance> BLAKE2_BAL </balance>
          <code> .ByteArray </code>
          <storage> _:Map </storage>
          <origStorage> _ </origStorage>
          <nonce> _ </nonce>
        </account>
       ...
      </accounts>
      <txOrder> _ </txOrder>
      <txPending> _ </txPending>
      <messages> _ </messages>
    </network>
  </ethereum>
requires #rangeAddress(ACCT_ID)
andBool ACCT_ID =/=Int 0
andBool #notPrecompileAddress(ACCT_ID)
andBool #rangeAddress(CALLER_ID)
andBool #rangeAddress(ORIGIN_ID)
andBool #rangeUInt(256, TIME)
andBool #rangeUInt(256, ACCT_ID_balance)
andBool #rangeUInt(256, ECREC_BAL)
andBool #rangeUInt(256, SHA256_BAL)
andBool #rangeUInt(256, RIP160_BAL)
andBool #rangeUInt(256, ID_BAL)
andBool #rangeUInt(256, MODEXP_BAL)
andBool #rangeUInt(256, ECADD_BAL)
andBool #rangeUInt(256, ECMUL_BAL)
andBool #rangeUInt(256, ECPAIRING_BAL)
andBool #rangeUInt(256, BLAKE2_BAL)
andBool VCallDepth <=Int 1024
andBool #rangeUInt(256, VCallValue)
andBool #rangeUInt(256, VChainId)

  andBool (#rangeUInt(256, May)
  andBool (#sizeByteArray(CD) <=Int 1250000000
  andBool (2300 <Int VGas -Int ((#if ( ( Junk_0 ==K 0 ) orBool (notBool ( Junk_2 ==K Junk_0 ) ) ) #then 0 #else 4200 #fi) +Int 6196)
  andBool (#rangeUInt(256, Junk_0)
  andBool (#rangeUInt(256, Junk_1)
  andBool (#rangeUInt(256, Junk_2)
  andBool ((May ==Int 1)
  andBool ((VCallValue ==Int 0)))))))))
[trusted]


// Pot_cage
rule [Pot.cage.pass]:
  <k> #execute ~> CONTINUATION => #halt ~> CONTINUATION </k>
  <exit-code> 1 </exit-code>
  <mode> NORMAL </mode>
  <schedule> ISTANBUL </schedule>
  <ethereum>
    <evm>
      <output> .ByteArray </output>
      <statusCode> _ => EVMC_SUCCESS </statusCode>
      <endPC> _ => ?_ </endPC>
      <callStack> _VCallStack </callStack>
      <interimStates> _ </interimStates>
      <touchedAccounts> _ => ?_ </touchedAccounts>
      <callState>
        <program> Pot_bin_runtime </program>
        <jumpDests> #computeValidJumpDests(Pot_bin_runtime) </jumpDests>
        <id> ACCT_ID </id>
        <caller> CALLER_ID </caller>
        <callData> #abiCallData("cage", .TypedArgs) ++ CD => ?_ </callData>
        <callValue> VCallValue </callValue>
        <wordStack> .WordStack => ?_ </wordStack>
        <localMem> .Memory => ?_ </localMem>
        <pc> 0 => ?_ </pc>
        <gas> VGas => ( VGas -Int ( (#if ( ( Live ==K 0 ) orBool (notBool ( Junk_2 ==K Live ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Dsr ==K 1000000000000000000000000000 ) orBool (notBool ( Junk_1 ==K Dsr ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Junk_1 ==K 0 ) andBool (notBool ( ( Dsr ==K 1000000000000000000000000000 ) orBool (notBool ( Junk_1 ==K Dsr ) ) ) ) ) #then 15000 #else 0 #fi) +Int 7055 ) ) ) ) </gas>
        <memoryUsed> 0 => ?_ </memoryUsed>
        <callGas> _ => ?_ </callGas>
        <static> false </static>
        <callDepth> VCallDepth </callDepth>
      </callState>
      <substate>
        <selfDestruct> _VSelfDestruct </selfDestruct>
        <log> _ => ?_ </log>
        <refund> _ => ?_ </refund>
      </substate>
      <gasPrice> _ </gasPrice>
      <origin> ORIGIN_ID </origin>
      <blockhashes> _ </blockhashes>
      <block>
        <previousHash> _ </previousHash>
        <ommersHash> _ </ommersHash>
        <coinbase> _ </coinbase>
        <stateRoot> _ </stateRoot>
        <transactionsRoot> _ </transactionsRoot>
        <receiptsRoot> _ </receiptsRoot>
        <logsBloom> _ </logsBloom>
        <difficulty> _ </difficulty>
        <number> _BLOCK_NUMBER </number>
        <gasLimit> _ </gasLimit>
        <gasUsed> _ </gasUsed>
        <timestamp> TIME </timestamp>
        <extraData> _ </extraData>
        <mixHash> _ </mixHash>
        <blockNonce> _ </blockNonce>
        <ommerBlockHeaders> _ </ommerBlockHeaders>
      </block>
    </evm>
    <network>
      <chainID> VChainId </chainID>
      <activeAccounts> SetItem(ACCT_ID)
      SetItem(1)
      SetItem(2)
      SetItem(3)
      SetItem(4)
      SetItem(5)
      SetItem(6)
      SetItem(7)
      SetItem(8)
      SetItem(9) _ </activeAccounts>
      <accounts>
        <account>
          <acctID> ACCT_ID </acctID>
          <balance> ACCT_ID_balance </balance>
          <code> Pot_bin_runtime </code>
          <storage>
           .Map
          [#Pot.wards[CALLER_ID] <- (May) => May]
          [#Pot.dsr <- (Dsr) => #Ray]
          [#Pot.live <- (Live) => 0]
            _:Map
           </storage>
          <origStorage>
           .Map
          [#Pot.wards[CALLER_ID] <- (Junk_0)]
          [#Pot.dsr <- (Junk_1)]
          [#Pot.live <- (Junk_2)]
            _:Map
           </origStorage>
          <nonce> _Nonce_Pot => ?_ </nonce>
        </account>
        <account>
          <acctID> 1 </acctID>
          <balance> ECREC_BAL </balance>
          <code> .ByteArray </code>
          <storage> _:Map </storage>
          <origStorage> _ </origStorage>
          <nonce> _ </nonce>
        </account>
        <account>
          <acctID> 2 </acctID>
          <balance> SHA256_BAL </balance>
          <code> .ByteArray </code>
          <storage> _:Map </storage>
          <origStorage> _ </origStorage>
          <nonce> _ </nonce>
        </account>
        <account>
          <acctID> 3 </acctID>
          <balance> RIP160_BAL </balance>
          <code> .ByteArray </code>
          <storage> _:Map </storage>
          <origStorage> _ </origStorage>
          <nonce> _ </nonce>
        </account>
        <account>
          <acctID> 4 </acctID>
          <balance> ID_BAL </balance>
          <code> .ByteArray </code>
          <storage> _:Map </storage>
          <origStorage> _ </origStorage>
          <nonce> _ </nonce>
        </account>
        <account>
          <acctID> 5 </acctID>
          <balance> MODEXP_BAL </balance>
          <code> .ByteArray </code>
          <storage> _:Map </storage>
          <origStorage> _ </origStorage>
          <nonce> _ </nonce>
        </account>
        <account>
          <acctID> 6 </acctID>
          <balance> ECADD_BAL </balance>
          <code> .ByteArray </code>
          <storage> _:Map </storage>
          <origStorage> _ </origStorage>
          <nonce> _ </nonce>
        </account>
        <account>
          <acctID> 7 </acctID>
          <balance> ECMUL_BAL </balance>
          <code> .ByteArray </code>
          <storage> _:Map </storage>
          <origStorage> _ </origStorage>
          <nonce> _ </nonce>
        </account>
        <account>
          <acctID> 8 </acctID>
          <balance> ECPAIRING_BAL </balance>
          <code> .ByteArray </code>
          <storage> _:Map </storage>
          <origStorage> _ </origStorage>
          <nonce> _ </nonce>
        </account>
        <account>
          <acctID> 9 </acctID>
          <balance> BLAKE2_BAL </balance>
          <code> .ByteArray </code>
          <storage> _:Map </storage>
          <origStorage> _ </origStorage>
          <nonce> _ </nonce>
        </account>
       ...
      </accounts>
      <txOrder> _ </txOrder>
      <txPending> _ </txPending>
      <messages> _ </messages>
    </network>
  </ethereum>
requires #rangeAddress(ACCT_ID)
andBool ACCT_ID =/=Int 0
andBool #notPrecompileAddress(ACCT_ID)
andBool #rangeAddress(CALLER_ID)
andBool #rangeAddress(ORIGIN_ID)
andBool #rangeUInt(256, TIME)
andBool #rangeUInt(256, ACCT_ID_balance)
andBool #rangeUInt(256, ECREC_BAL)
andBool #rangeUInt(256, SHA256_BAL)
andBool #rangeUInt(256, RIP160_BAL)
andBool #rangeUInt(256, ID_BAL)
andBool #rangeUInt(256, MODEXP_BAL)
andBool #rangeUInt(256, ECADD_BAL)
andBool #rangeUInt(256, ECMUL_BAL)
andBool #rangeUInt(256, ECPAIRING_BAL)
andBool #rangeUInt(256, BLAKE2_BAL)
andBool VCallDepth <=Int 1024
andBool #rangeUInt(256, VCallValue)
andBool #rangeUInt(256, VChainId)

  andBool (#rangeUInt(256, May)
  andBool (#rangeUInt(256, Dsr)
  andBool (#rangeUInt(256, Live)
  andBool (#sizeByteArray(CD) <=Int 1250000000
  andBool (2300 <Int ( VGas -Int ( (#if ( ( Live ==K 0 ) orBool (notBool ( Junk_2 ==K Live ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Dsr ==K 1000000000000000000000000000 ) orBool (notBool ( Junk_1 ==K Dsr ) ) ) #then 0 #else 4200 #fi) +Int ( (#if ( ( Junk_1 ==K 0 ) andBool (notBool ( ( Dsr ==K 1000000000000000000000000000 ) orBool (notBool ( Junk_1 ==K Dsr ) ) ) ) ) #then 15000 #else 0 #fi) +Int 7055 ) ) ) )
  andBool (#rangeUInt(256, Junk_0)
  andBool (#rangeUInt(256, Junk_1)
  andBool (#rangeUInt(256, Junk_2)
  andBool ((May ==Int 1)
  andBool ((VCallValue ==Int 0)))))))))))
[trusted]


endmodule
