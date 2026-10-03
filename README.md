# Nginx Image Volume Server

This project runs a lightweight Nginx server that displays files from a folder on your computer. It uses **Docker** and **Docker Compose** to make running and deploying easy.

## Prerequisites

* Docker Installed
* Git (for downloading the project)

## Quick Start (Recommended)

The easiest way to run this project is with Docker Compose.

1.  **Clone the Repository:**
    ```bash
    git clone <your-repo-url>
    cd <your-repo-folder>
    ```

2.  **Add Your Images:**
    Ensure you have an `images` folder in this directory and add your files to it.
    *(Note: If the `images` folder is missing, create it: `mkdir images`)*

3.  **Run the Server:**
    ```bash
    docker compose up -d
    ```
    * `-d` runs it in the background.

4.  **View Your Images:**
    Open [http://localhost:8080](http://localhost:8080).

5.  **Stop the Server:**
    ```bash
    docker compose down
    ```

---

## Manual Run (Without Compose)

If you prefer to run raw Docker commands:

1.  **Build:**
    ```bash
    docker build -t volume-image-server .
    ```

2.  **Run:**
    * **Mac/Linux:**
        ```bash
        docker run -d -p 8080:80 -v "$(pwd)/images":/usr/share/nginx/html/images --name my-volume-server volume-image-server
        ```
    * **Windows (cmd):**
        ```cmd
        docker run -d -p 8080:80 -v "%cd%\images":/usr/share/nginx/html/images --name my-volume-server volume-image-server
        ```

---

## Deployment Guide (Live Server)

To deploy this to a VPS (like DigitalOcean, AWS EC2, or Linode):

1.  **SSH into your server.**
2.  **Install Docker & Docker Compose** on the server.
3.  **Authenticate with GitHub:**
    Since your repo is private, you will need to generate a "Personal Access Token" (Classic) on GitHub with `repo` permissions. Use that token as your password when cloning.
4.  **Clone & Run:**
    ```bash
    git clone https://github.com/yourusername/your-repo.git
    cd your-repo
    
    # Create the folder if it's not in git
    mkdir -p images 
    
    # Upload images (using SCP or FTP) to the 'images' folder on the server
    
    # Start it up
    docker compose up -d
    ```

## Troubleshooting

* **Changes not showing?**
    If you change the `nginx.conf`, you must rebuild:
    ```bash
    docker compose up -d --build
    ```
    If you just add images, you only need to refresh your browser.