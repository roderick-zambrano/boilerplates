# Registry

## Requirements

## Setup

## Configuration

## Notes

To push an image to the registry, you first need to give it a tag that includes the destination registry. If you are hosting your registry at "example.domain.name", then your image should be tagged `https://example.domain.name[:PORT]/image_name[:TAG]`, which will push it to "https://example.domain.name/image_name" when you call `docker push https://example.domain.name[:PORT]/image_name[:TAG]`
