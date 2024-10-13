<template>
  <div>메시ㅁㄴㅇasdaasdasdsd지</div>
  <div >
    <input type="text" v-model="msg"><button @click="insert" style="color: red;">클릭</button>
  </div>

  <div>
    <ul>
      <li v-for="(index,msg) in msgList" :key="msg">{{index }}</li>

    </ul>
  </div>
</template>
<script>
import axios from 'axios';
export default {
 data(){
  return{
    msg:'',
    msgList:[]
  }
 },
 methods:{
  get(){
    axios.get('http://localhost:8080/api/v1/msg')
    .then((res)=>{
      this.msgList= res.data
    })
  },
  insert(){
    axios.post('http://localhost:8080/api/v1/msg' , {
      message:this.msg
    })
    .then(()=>{
      this.get()
    })
  }
 }
}
</script>


