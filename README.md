# 📝 Assignment Grader

An AI-powered tool that automatically grades academic assignments, checks for plagiarism, and provides detailed feedback to students.

## 🚀 Project Overview

Assignment Grader is a web application designed to streamline the grading process for educators. It leverages AI to analyze student submissions, evaluate them based on customizable rubrics, detect potential plagiarism, and generate constructive feedback—all in one unified platform. This tool is perfect for teachers, professors, and educational institutions looking to save time while providing consistent, high-quality feedback to students.

### Key Features

- 📄 Upload and process PDF or Word documents
- ✅ Grade assignments using customizable rubrics
- 🔍 Check for plagiarism with similarity detection
- 📊 Generate detailed feedback and reports
- 💾 Download comprehensive grading reports

## 🛠️ Technologies Used

- **Backend**: FastAPI, Python 3.12
- **Frontend**: Streamlit
- **AI Services**: OpenAI API (GPT models)
- **Plagiarism Detection**: Google Custom Search API
- **Document Processing**: PyMuPDF, python-docx
- **Deployment**: Docker
- **Package Management**: uv (Python package installer)

## 📋 Prerequisites

- Python 3.12 or higher
- OpenAI API key
- Google Cloud API key with Custom Search API enabled
- Google Programmable Search Engine ID
- Docker (optional, for containerized deployment)

## ⚙️ Installation

### Method 1: Using uv (Without Docker)

1. Clone the repository:
   ```bash
   git clone https://github.com/suraj-yadav-aiml/Assignment-Grader.git
   cd Assignment-Grader
   ```

2. Install dependencies using uv:
   ```bash
   uv sync
   ```

3. Create a `.env` file in the project root with your API keys:
   ```
   OPENAI_API_KEY="your_openai_api_key"
   GOOGLE_API_KEY="your_google_api_key"
   SEARCH_ENGINE_ID="your_search_engine_id"
   ```

### Method 2: Using Docker

1. Clone the repository:
   ```bash
   git clone https://github.com/suraj-yadav-aiml/Assignment-Grader.git
   cd Assignment-Grader
   ```

2. Build the Docker image:
   ```bash
   docker build -t assignment-grader .
   ```

3. Run the container with your API keys:
   ```bash
   docker run -p 80:80 \
     -e OPENAI_API_KEY="your_openai_api_key" \
     -e GOOGLE_API_KEY="your_google_api_key" \
     -e SEARCH_ENGINE_ID="your_search_engine_id" \
     assignment-grader
   ```

## 🚀 Usage

### Running the Application (Without Docker)

1. Start the backend server:
   ```bash
   uv run server.py
   ```

2. In a separate terminal, start the frontend:
   ```bash
   uv run streamlit run client.py
   ```

3. Open your browser and navigate to:
   - http://localhost:8501 (Streamlit interface)

### Running with Docker

After starting the Docker container, access the application at:
- http://localhost:80

### How to Use

1. **Upload**: Click on the "Upload" tab and upload a PDF or Word document.
2. **Process**: Click "Process Document" to extract the text from the document.
3. **Configure Grading**: On the "Grade" tab, select or create a rubric and configure grading options.
4. **Grade**: Click "Grade Assignment" to analyze the document.
5. **Review**: View the grade, feedback, and plagiarism results in the "Results" tab.
6. **Download**: Generate and download a comprehensive report of the results.

## 🧩 Project Structure

```
📂 Assignment-Grader/
  📄 .dockerignore         # Docker build exclusions
  📄 .env.example          # Template for environment variables
  📄 .gitignore            # Git exclusions
  📄 .python-version       # Python version specification
  📄 README.md             # Project documentation
  📄 client.py             # Streamlit frontend application
  📄 dockerfile            # Docker configuration
  📄 pyproject.toml        # Project dependencies and metadata
  📄 requirements.txt      # Python dependencies
  📄 server.py             # FastAPI backend server
```

## 🔑 Obtaining API Keys

### OpenAI API Key
1. Visit [OpenAI Platform](https://platform.openai.com/)
2. Create an account or sign in
3. Navigate to API keys section and create a new key

### Google API Key and Search Engine ID
1. **Google API Key**:
   - Go to [Google Cloud Console](https://console.cloud.google.com/)
   - Create a new project or select an existing one
   - Navigate to "APIs & Services" > "Library"
   - Search for and enable "Custom Search API"
   - Go to "APIs & Services" > "Credentials"
   - Click "Create Credentials" > "API Key"

2. **Search Engine ID**:
   - Visit [Programmable Search Engine](https://programmablesearchengine.google.com/controlpanel/all)
   - Click "Add" to create a new search engine
   - Follow the prompts to configure your search engine
   - Once created, find your Search Engine ID in the setup details

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

---

Built with ❤️ by [Suraj Yadav](https://github.com/suraj-yadav-aiml)