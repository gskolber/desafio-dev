<template>
    <div>
        <label class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300" for="file_input">Upload de novo
            CNAB</label>
        <input @change="previewFile"
            class="block w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 cursor-pointer dark:text-gray-400 focus:outline-none dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400"
            aria-describedby="file_input_help" id="file_input" type="file" multipart="true">
        <p class="mt-1 text-sm text-gray-500 dark:text-gray-300" id="file_input_help">.txt files</p>

        <button @click="onUpload"
            class="bg-gray-300 hover:bg-gray-400 text-gray-800 font-bold py-2 px-4 rounded inline-flex items-center">
            <svg class="fill-current w-4 h-4 mr-2" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
                <path d="M13 8V2H7v6H2l8 8 8-8h-5zM0 18h20v2H0v-2z" />
            </svg>
            <span>Upload</span>
        </button>
    </div>
</template>

<script>
import axios from 'axios';
export default {
    data() {
        return {
            selectedFile: null
        }
    },
    methods: {
        previewFile(event) {
            console.log(event.target.files[0])
            this.selectedFile = event.target.files[0]
        },
        onUpload() {
            const formData = new FormData()
            formData.append('document', this.selectedFile)
            axios.post('http://localhost:4000/api/upload', formData, {
                headers: {
                    'Content-Type': 'multipart/form-data'
                }
            }).then(response => {
                console.log(response)
            }).catch(error => {
                console.log(error)
            })
        },
    }
}
</script>