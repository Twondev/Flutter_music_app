import uuid
from fastapi import APIRouter, Depends, File, Form, UploadFile
from sqlalchemy.orm import Session

from database import get_db
from middleware.auth_middleware import auth_middleware
import cloudinary
import cloudinary.uploader

from models.song import Song

router = APIRouter()
# Configuration
cloudinary.config(
    cloud_name="dq4hdvps0",
    api_key="831756155613265",
    # Click 'View API Keys' above to copy your API secret
    api_secret="XdsscAR6hNDg2aaunPO3glSXgnI",
    secure=True
)


@router.post('/upload', status_code=201)
def upload_song(song: UploadFile = File(...), thumbnail: UploadFile = File(...),
                artist: str = Form(...),
                song_name: str = Form(...),
                hex_code: str = Form(...),
                db: Session = Depends(get_db),
                auth_dict=Depends(auth_middleware)):
    print(f"Song filename: {song.filename}")
    print(f"Song content type: {song.content_type}")
    print(f"Song file size: {song.file}")
    song_id = str(uuid.uuid4())
    song_res = cloudinary.uploader.upload(
        song.file, resource_type='video', folder=f'songs/{song_id}')
    thumbnail_res = cloudinary.uploader.upload(
        thumbnail.file, resource_type='image', folder=f'songs/{song_id}')

    new_song = Song(
        id=song_id,
        song_name=song_name,
        artist=artist,
        hex_code=hex_code,
        song_url=song_res['url'],
        thumbnail_url=thumbnail_res['url'],
    )
    db.add(new_song)
    db.commit()
    db.refresh(new_song)
    return new_song