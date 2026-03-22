# API Keys and Routes Documentation

## ⚠️ SECURITY WARNING
The following API keys and authentication tokens are currently **hardcoded** in `flows.json`. 

---

## API Keys & Credentials

### 1. SERPAPI - Google Trends
- **Location**: Trend Flow - "build SERPAPI request" function
- **JSON Lines**: 789-809
- **Key Location**: Line 803: `"1b31b5d2bfb359824af5cc3fab4aa33a3164be0c31c03792575680f9ba3e4fe0"`
- **Route Location**: Line 805: `https://serpapi.com/search.json?engine=google_trends...`
- **Usage**: Fetches Google Trends data for product search trends

### 2. YouTube Data API v3 - Video Search
- **Location**: Sentiment Flow - "build YouTube video search requests" function
- **JSON Lines**: 1006-1023
- **Key Location**: Line 1011: `AIzaSyB5Akr38qW4F6Jl-J92E0JDh_AjDTn5ivA`
- **Route Location**: Line 1013: `https://www.googleapis.com/youtube/v3/search?part=snippet...`
- **Usage**: Searches for product review videos

### 3. YouTube Data API v3 - Comments
- **Location**: Sentiment Flow - "get YouTube comments" function
- **JSON Lines**: 1225-1243
- **Key Location**: Line 1230: `AIzaSyB5Akr38qW4F6Jl-J92E0JDh_AjDTn5ivA`
- **Route Location**: Line 1235: `https://www.googleapis.com/youtube/v3/commentThreads?part=snippet...`
- **Usage**: Retrieves comments from YouTube videos

### 4. Google Cloud Natural Language API
- **Location**: Sentiment Flow - Node ID: `facbfc970ede32a7`
- **JSON Lines**: 106-109
- **Credentials**: `linh-key-file` (google-cloud-credentials)
- **Usage**: Performs sentiment analysis on YouTube comments

### 5. Google Gemini AI API
- **Location**: Gemini Flow - Node ID: `7c7b0a47f141b0c2`
- **JSON Lines**: 367-377
- **Type**: `factory-agent-gemini`
- **Model**: `gemini-2.0-flash-lite`
- **Usage**: Generates inventory recommendations based on analysis

### 6. Firebase Realtime Database
- **Location**: Database Flow - Multiple nodes
- **Auth Token**: `RqgAoe4IuML15ztQStVDPpEERh4XeOkseQSVoRdr`
- **Base URL**: `https://connect-f885d-default-rtdb.asia-southeast1.firebasedatabase.app`
- **Routes**:
  - **GET `/products.json`** - Line 1451
  - **GET `/products/{{{product_name}}}.json`** - Line 1562
  - **PUT `/products/{product_name}.json`** - Line 1602 (in "Append New Record" function)
- **Usage**: Stores and retrieves product inventory data

---

## API Integration Points in Flow

1. **Gemini Flow** (`0f2ea8e68f1bceae`)
   - Main entry point: `POST /gemini`
   - Orchestrates all sub-flows

2. **Trend Flow** (`163ec25ad17b0fc3`)
   - Entry point: `POST /trend`
   - Calls SERPAPI

3. **Sentiment Flow** (`f6f2187d.f17ca8`)
   - Entry point: `POST /sentiment`
   - Calls YouTube APIs and Google Cloud NLP

4. **Database Flow** (`295f0eede1eed1eb`)
   - Entry points: `GET /products/:product_name`, `POST /products/:product_name`
   - Calls Firebase

---

