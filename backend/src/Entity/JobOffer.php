<?php

namespace App\Entity;

use App\Repository\JobOfferRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: JobOfferRepository::class)]
#[ORM\Table(name: 'job_offers')]
#[ORM\HasLifecycleCallbacks]
class JobOffer
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(name: 'id_job_offer')]
    private ?int $id = null;

  
    #[ORM\Column(name: 'studio_id')]
    private ?int $studio_id = null;

    #[ORM\Column(name: 'title', length: 255, nullable: true)]
    private ?string $title = null;

    #[ORM\Column(name: 'description', type: 'text', nullable: true)]
    private ?string $description = null;

    #[ORM\Column(name: 'contract_type', length: 100, nullable: true)]
    private ?string $contractType = null;

    #[ORM\Column(name: 'location', length: 255, nullable: true)]
    private ?string $location = null;

    #[ORM\Column(name: 'salary_min', type: 'decimal', precision: 10, scale: 2, nullable: true)]
    private ?string $salaryMin = null;

    #[ORM\Column(name: 'salary_max', type: 'decimal', precision: 10, scale: 2, nullable: true)]
    private ?string $salaryMax = null;

    #[ORM\Column(name: 'start_date', type: 'date', nullable: true)]
    private ?\DateTimeInterface $startDate = null;

    #[ORM\Column(name: 'end_date', type: 'date', nullable: true)]
    private ?\DateTimeInterface $endDate = null;

    #[ORM\Column(name: 'created_at', type: 'datetime')]
    private ?\DateTimeInterface $createdAt = null;

    #[ORM\Column(name: 'updated_at', type: 'datetime')]
    private ?\DateTimeInterface $updatedAt = null;

   //getters

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getStudioId(): ?int
    {
        return $this->studio_id;
    }

    public function getTitle(): ?string
    {
        return $this->title;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function getContractType(): ?string
    {
        return $this->contractType;
    }

    public function getLocation(): ?string
    {
        return $this->location;
    }

    public function getSalaryMin(): ?float
    {
        return $this->salaryMin ? (float)$this->salaryMin : null;
    }

    public function getSalaryMax(): ?float
    {
        return $this->salaryMax ? (float)$this->salaryMax : null;
    }

    public function getStartDate(): ?\DateTimeInterface
    {
        return $this->startDate;
    }

    public function getEndDate(): ?\DateTimeInterface
    {
        return $this->endDate;
    }

    public function getCreatedAt(): ?\DateTimeInterface
    {
        return $this->createdAt;
    }

    public function getUpdatedAt(): ?\DateTimeInterface
    {
        return $this->updatedAt;
    }

   //setters

    public function setStudioId(?int $studio_id): self
    {
        $this->studio_id = $studio_id;
        return $this;
    }

    public function setTitle(?string $title): self
    {
        $this->title = $title;
        return $this;
    }

    public function setDescription(?string $description): self
    {
        $this->description = $description;
        return $this;
    }

    public function setContractType(?string $contractType): self
    {
        $this->contractType = $contractType;
        return $this;
    }

    public function setLocation(?string $location): self
    {
        $this->location = $location;
        return $this;
    }

    public function setSalaryMin(?float $salaryMin): self
    {
        $this->salaryMin = $salaryMin !== null ? (string)$salaryMin : null;
        return $this;
    }

    public function setSalaryMax(?float $salaryMax): self
    {
        $this->salaryMax = $salaryMax !== null ? (string)$salaryMax : null;
        return $this;
    }

    public function setStartDate(?\DateTimeInterface $startDate): self
    {
        $this->startDate = $startDate;
        return $this;
    }

    public function setEndDate(?\DateTimeInterface $endDate): self
    {
        $this->endDate = $endDate;
        return $this;
    }

    // à chaque modif updatedAt se met à jour

    #[ORM\PrePersist]
    public function onCreate(): void
    {
        $this->createdAt = new \DateTime();
        $this->updatedAt = new \DateTime();
    }

    #[ORM\PreUpdate]
    public function onUpdate(): void
    {
        $this->updatedAt = new \DateTime();
    }
}